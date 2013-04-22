using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using Microsoft.WindowsAzure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AzureCloudServices.Common.Helpers
{
public static class ServiceBusQueueHelper
{
//// Recommended that you cache QueueClient       
//// rather than recreating it on every request.
public static QueueClient CustomersQueueClient;
// The name of the queue
public const string QueueName = "CustomerQueue";


public static NamespaceManager CreateNamespaceManager()
{
    string connectionString =
    CloudConfigurationManager.GetSetting(
    "Microsoft.ServiceBus.ConnectionString");
    var namespaceManager = NamespaceManager.
        CreateFromConnectionString(connectionString);
    return namespaceManager;
}
public static void Initialize()
{
    // Using Http to be friendly with outbound firewalls
    ServiceBusEnvironment.SystemConnectivity.Mode =
        ConnectivityMode.Http;
    string connectionString =
        CloudConfigurationManager.GetSetting
        ("Microsoft.ServiceBus.ConnectionString");
    NamespaceManager namespaceManager = CreateNamespaceManager();
    if (!(namespaceManager.QueueExists(QueueName)))
    {
        namespaceManager.CreateQueue(QueueName);
    }

    // Initialize the connection to Service Bus Queue
    CustomersQueueClient = QueueClient.
        CreateFromConnectionString(connectionString, QueueName);
}
}
}
