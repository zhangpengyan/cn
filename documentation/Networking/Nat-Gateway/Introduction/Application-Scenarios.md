# 应用场景


安全的公网访问，虚机可以通过NAT网关访问互联网，并阻止互联网主动发起连接访问这些虚机实例。
共享带宽，内网多实例共享同一NAT公网IP带宽访问互联网。
![单NAT网关](../../../../image/Networking/Nat-Gateway/nat-1.png)


同一VPC内创建多个NAT网关，将后端不同子网指向不同的NAT网关，从而对不同的业务流量按子网隔离。
![多NAT网关](../../../../image/Networking/Nat-Gateway/nat-2.png)
