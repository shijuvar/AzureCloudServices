using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using AzureCloudServices.Domain.Commands;
using Microsoft.WindowsAzure.Storage;
using System.Configuration;
using Microsoft.WindowsAzure.Storage.Table;
using AzureCloudServices.Domain.Models;

namespace AzureCloudServices.Worker
{
    public class WorkerRole : RoleEntryPoint
    {
        // The name of your queue
        const string QueueName = "CustomerQueue";

        // QueueClient is thread-safe. Recommended that you cache 
        // rather than recreating it on every request
        public static QueueClient Client;
        bool IsStopped;

        public override void Run()
        {

            var storageAccount = CloudStorageAccount.Parse
                (RoleEnvironment.GetConfigurationSettingValue("StorageConnectionString"));
           
            // Get table and queue objects for working with tables and queues.
            
            while (!IsStopped)
            {
                try
                {
                    // Receive the message
                    BrokeredMessage receivedMessage = null;
                    receivedMessage = Client.Receive();

                    if (receivedMessage != null)
                    {
                        // Process the message
                        Trace.WriteLine("Processing", receivedMessage.SequenceNumber.ToString());
                        NewCustomerCommand command = receivedMessage.GetBody<NewCustomerCommand>();
                        // Create the table client.
                        CloudTableClient tableClient = storageAccount.CreateCloudTableClient();

                        // Create the CloudTable object that represents the "Customer" table.
                        CloudTable table = tableClient.GetTableReference("Customer");

                        // Create a new customer entity.
                        Customer customer=new Customer{
                            Id=Guid.NewGuid().ToString(),
                            PartitionKey = command.LastName,
                            RowKey = command.FirstName,
                            FirstName=command.FirstName,
                            LastName=command.LastName,
                            Address=command.Address,
                            Email=command.Email,
                            Phone=command.Phone                                
                        };

                        // Create the TableOperation that inserts the customer entity.
                        TableOperation insertOperation = TableOperation.Insert(customer);

                        // Execute the insert operation.
                        table.Execute(insertOperation);
                        receivedMessage.Complete();
                    }
                }
                catch (MessagingException e)
                {
                    if (!e.IsTransient)
                    {
                        Trace.WriteLine(e.Message);
                        throw;
                    }

                    Thread.Sleep(10000);
                }
                catch (OperationCanceledException e)
                {
                    if (!IsStopped)
                    {
                        Trace.WriteLine(e.Message);
                        throw;
                    }
                }
            }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections 
            ServicePointManager.DefaultConnectionLimit = 12;

            // Create the queue if it does not exist already
            string connectionString = CloudConfigurationManager.GetSetting("Microsoft.ServiceBus.ConnectionString");
            var namespaceManager = NamespaceManager.CreateFromConnectionString(connectionString);
            if (!namespaceManager.QueueExists(QueueName))
            {
                namespaceManager.CreateQueue(QueueName);
            }

            // Initialize the connection to Service Bus Queue
            Client = QueueClient.CreateFromConnectionString(connectionString, QueueName);
            IsStopped = false;
            return base.OnStart();
        }

        public override void OnStop()
        {
            // Close the connection to Service Bus Queue
            IsStopped = true;
            Client.Close();
            base.OnStop();
        }
    }
}
