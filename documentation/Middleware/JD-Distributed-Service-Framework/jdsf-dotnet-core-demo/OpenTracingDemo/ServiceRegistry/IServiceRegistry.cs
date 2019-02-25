using System;
namespace OpenTracingDemo.ServiceRegistry
{
    public interface IServiceRegistry
    {
        void RegistryService(DiscoverOption option);

        void DeRegistryService(string serviceId);
    }
}
