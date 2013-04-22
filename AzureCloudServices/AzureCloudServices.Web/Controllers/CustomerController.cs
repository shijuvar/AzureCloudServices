using AutoMapper;
using AzureCloudServices.Common.Helpers;
using AzureCloudServices.Domain.Commands;
using AzureCloudServices.Domain.Models;
using AzureCloudServices.Web.ViewModels;
using Microsoft.ServiceBus.Messaging;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AzureCloudServices.Web.Controllers
{
    public class CustomerController : Controller
    {  
        public ActionResult Index()
        {
            CloudTable table = AzureStorageHelper.GetAzureTable("Customer");         
            TableQuery<Customer> query = new TableQuery<Customer>();
            var customers = table.ExecuteQuery(query);
            if (Request.IsAjaxRequest())
            {
                return PartialView("_List", customers);
            }
            return View(customers);
        }
        public ViewResult Create()
        {
            var viewModel = new CustomerFormModel();
            return View(viewModel);
        }
    [HttpPost]
    public ActionResult Create(CustomerFormModel form)
    {
    if (ModelState.IsValid)
    {
        //maps to domain object from view model
        var command = Mapper.Map<CustomerFormModel,
            NewCustomerCommand>(form);
        var message = new BrokeredMessage(command);
        // Send customer message to Service Bus Queue          
        ServiceBusQueueHelper.CustomersQueueClient.Send(message);
        return RedirectToAction("Index");
    }
    return View(form);
    }
  }
}
