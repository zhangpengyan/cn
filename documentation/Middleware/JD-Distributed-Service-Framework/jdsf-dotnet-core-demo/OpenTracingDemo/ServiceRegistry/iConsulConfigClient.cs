using System;
using System.Threading.Tasks;
using Consul;

namespace OpenTracingDemo.ServiceRegistry
{
    public interface IConsulConfigClient
    {
        ConsulClient GetConsulClient();

        void ReloadConsulConsulClient(string hostIp);

        Task<HealthServiceInfo> GetHealthService(string serviceName);

        void ReloadServiceFromRegistry();
    }
}
