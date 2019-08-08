# 5	应用集成 API 在万象的最佳实践

## 5.1	整体架构 
万象平台作为中间层，可以帮助企业实现应用的快速集成，并且减少了集成的复杂度。 

下图中包含几个模块。 

1. 万象平台。万象平台在此处充当 API 网关的作用，用于连接为各个应用系统封装API，并形成统一的 api 端点。

2. 企业应用模块。企业应用模块一般部署到客户的数据中心或云上的私有网络中，有防火墙或者安全组负责边界防护。企业应用间相互会有调用关系，用于完成一些业务逻辑。 

3. 第三方企业 SaaS 服务。第三方企业 SaaS 服务主要是指提供 ERP、CRM 等企业管理软件服务的公司，也提供标准的 API 供第三方调用。 

4. 第三方通用 SaaS 服务。通用 SaaS 服务主要指提供通用数据信息的 SaaS 服务，如天气信息、身份认证信息、短信服务等等常规普遍服务。 

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Enterprise-Integration-Best-Practice-with-WanXiangAPI/Appliction-Integration-API-Best-Practices.png)
