using System;
namespace OpenTracingDemo.ServiceRegistry
{
    public class ServiceHostOption
    {
        public ServiceHostOption()
        {
        
        }

        public string HostIpAddress { get; set; } = "0.0.0.0";


        public int HostPort { get; set; } = 5000;
    }
}
