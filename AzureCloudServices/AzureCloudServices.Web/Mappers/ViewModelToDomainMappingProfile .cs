using AutoMapper;
using AzureCloudServices.Domain.Commands;
using AzureCloudServices.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AzureCloudServices.Web.Mappers
{
    public class ViewModelToDomainMappingProfile : Profile
    {
        public override string ProfileName
        {
            get { return "ViewModelToDomainMappings"; }
        }

        protected override void Configure()
        {
            Mapper.CreateMap<CustomerFormModel, NewCustomerCommand>();
            
        }
    }
}