﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------



[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
[System.ServiceModel.ServiceContractAttribute(ConfigurationName="IService1")]
public interface IService1
{
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/IniciarWorkflow", ReplyAction="http://tempuri.org/IService1/IniciarWorkflowResponse")]
    string IniciarWorkflow();
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IService1/IniciarWorkflow", ReplyAction="http://tempuri.org/IService1/IniciarWorkflowResponse")]
    System.Threading.Tasks.Task<string> IniciarWorkflowAsync();
}

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public interface IService1Channel : IService1, System.ServiceModel.IClientChannel
{
}

[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public partial class Service1Client : System.ServiceModel.ClientBase<IService1>, IService1
{
    
    public Service1Client()
    {
    }
    
    public Service1Client(string endpointConfigurationName) : 
            base(endpointConfigurationName)
    {
    }
    
    public Service1Client(string endpointConfigurationName, string remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public Service1Client(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public Service1Client(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(binding, remoteAddress)
    {
    }
    
    public string IniciarWorkflow()
    {
        return base.Channel.IniciarWorkflow();
    }
    
    public System.Threading.Tasks.Task<string> IniciarWorkflowAsync()
    {
        return base.Channel.IniciarWorkflowAsync();
    }
}
