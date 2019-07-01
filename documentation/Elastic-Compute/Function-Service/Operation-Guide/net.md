# 网络配置

Function默认部署于公共网络中，无法访问VPC中的资源。

 
**配置Function函数访问VPC资源**

通常，您在京东云VPC内部创建资源，以便这些资源不能通过公共 Internet 访问。默认情况下，无法通过Function函数访问 VPC 中的资源。

若您的Function函数想要访问VPC 中的资源，如数据库、Redis等产品或服务，您必须提供私有网络和子网的配置信息。

**请注意以下注意事项：**

当您将 VPC 配置添加到Function函数时，它只能访问该 VPC 中的资源。如果Function 函数既要访问 VPC 资源又要访问公共 Internet，那么 VPC 内部必须配置网络地址转换 (NAT) 实例，详情请参考京东云[NAT实例网关](https://docs.jdcloud.com/cn/virtual-private-cloud/nat-instance-gateway)。
