# 基础架构
京东云微服务平台每个地域采用跨可用区部署。每个用户的每个服务都是独立部署在用户的VPC中，与其他用户的数据完全隔离。服务部署后，用户可以通过RESTful API对所有功能进行调用。除了目前已支持的注册中心、配置中心、调用链分析，京东云微服务平台将在未来打通消息队列、API Gateway 等服务，满足用户多样化的需求。



## 业务架构

![](../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsf-struct.png)



