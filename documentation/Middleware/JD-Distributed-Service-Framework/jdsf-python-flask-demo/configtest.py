from loadbalance.registryservice import RegistryService
from loadbalance.consulconfig import ConsulConfig


def test_load_registry():
    registry_service = RegistryService()
    registry_service.registry_service()


def test_load_consul_config():
    config = ConsulConfig.load_config()
    print config


if __name__ == '__main__':
    test_load_consul_config()