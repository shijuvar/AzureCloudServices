using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.ServiceRuntime;
namespace AzureCloudServices.Common.Helpers
{
public static class AzureStorageHelper
{
public static void InitializeAzureTable(string tableName)
{
    CloudTable table = GetAzureTable(tableName);
    //Create table if it doesn't exists
    table.CreateIfNotExists();        
}

public static CloudTable GetAzureTable(string tableName)
{
    var storageAccount = Microsoft.WindowsAzure.Storage
        .CloudStorageAccount.Parse(
        RoleEnvironment.GetConfigurationSettingValue
        ("StorageConnectionString"));
    // Get table for working with tables.
    var tableClient = storageAccount.CreateCloudTableClient();
    CloudTable table = tableClient.GetTableReference(tableName);
    return table;
}       
}
}
