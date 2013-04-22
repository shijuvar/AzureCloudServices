<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudServices" generation="1" functional="0" release="0" Id="62cca345-8810-4750-91d0-78f61dde2916" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudServicesGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AzureCloudServices.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudServices/AzureCloudServicesGroup/LB:AzureCloudServices.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AzureCloudServices.Web:Microsoft.ServiceBus.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.Web:Microsoft.ServiceBus.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.Web:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.Web:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.WebInstances" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.Worker:Microsoft.ServiceBus.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.Worker:Microsoft.ServiceBus.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.Worker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.Worker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.Worker:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.Worker:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCloudServices.WorkerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudServices/AzureCloudServicesGroup/MapAzureCloudServices.WorkerInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AzureCloudServices.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAzureCloudServices.Web:Microsoft.ServiceBus.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Web/Microsoft.ServiceBus.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.Web:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Web/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WebInstances" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.Worker:Microsoft.ServiceBus.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Worker/Microsoft.ServiceBus.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.Worker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Worker/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.Worker:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Worker/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCloudServices.WorkerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WorkerInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureCloudServices.Web" generation="1" functional="0" release="0" software="D:\WindowsAzure\AzureCloudServices\AzureCloudServices\csx\Debug\roles\AzureCloudServices.Web" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.ServiceBus.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureCloudServices.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureCloudServices.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;AzureCloudServices.Worker&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WebInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WebUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="AzureCloudServices.Worker" generation="1" functional="0" release="0" software="D:\WindowsAzure\AzureCloudServices\AzureCloudServices\csx\Debug\roles\AzureCloudServices.Worker" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaWorkerHost.exe " memIndex="1792" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.ServiceBus.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureCloudServices.Worker&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureCloudServices.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;AzureCloudServices.Worker&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WorkerInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WorkerUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.WorkerFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="AzureCloudServices.WebUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="AzureCloudServices.WorkerUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="AzureCloudServices.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="AzureCloudServices.WorkerFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureCloudServices.WebInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="AzureCloudServices.WorkerInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="f86726c7-9f1b-4c75-a905-901060cc75b1" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCloudServicesContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="3ca5cbd8-a7a6-4189-aff8-4adb0ee32c8c" ref="Microsoft.RedDog.Contract\Interface\AzureCloudServices.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudServices/AzureCloudServicesGroup/AzureCloudServices.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>