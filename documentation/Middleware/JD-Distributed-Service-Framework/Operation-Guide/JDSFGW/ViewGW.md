#  查看服务

## 操作场景
查看当前用户所创建的、运行中的微服务网关服务信息。

## 操作步骤

###  查看微服务网关服务详情

1、	登录微服务平台控制台

2、	在左侧导航栏点击微服务网关，进入服务列表页

3、	在服务列表中，点击要查看的服务名称，即可进入详情页查看信息。一个微服务网关服务的信息包含两部分：基本信息、API分组列表信息。

 
![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-jbxx-1.png) 


#####  在基本信息tab页中，包含两部分信息：

1、	微服务网关服务自身的基本信息

2、	微服务网关所服务的注册中心的相关信息。

-  这里用户可随时更新应用信息列表。只有被选择的应用，才可被微服务网关服务发现。

-  当用户进行应用调用时，需按照VPC内调用路径规则进行访问。

![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-jbxx-2.png) 
 
  

#####   在API分组列表tab页中，展示了该微服务网关服务通过API网关方式发布后，所关联选择的API分组的信息汇总。

![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-jbxx-3apilist.png) 
 
1、	一个微服务网关服务可以通过多个api分组提供访问。

2、	API分组可以和微服务网关不在同一区域。

3、	在客户端请求API网关，API网关将用户请求转换到后端微服务过程中注意：

-  客户端请求API网关时，请求路径规则：http(s)://host/分组路径前缀/{发布的微服务名称}/{用户服务里定义的接口路径} 。

-  API网关将不会把API分组的分组路径前缀传到后端服务。


4、	绑定API分组操作：为绑定微服务网关服务与API分组的过程。绑定时，需要精确到API分组的发布环境。注意：

-  只有API分组类型为“微服务API分组” 的API分组，才会出现在可选绑定的列表中。

-  API分组的每个发布环境里只能绑定唯一一个后端服务，因此绑定环境信息时，只有在该环境下未被绑定过的API分组才能进行绑定操作。且系统会自动过滤掉不能绑定的分组信息。

例如：API分组abs的测试环境，已经选择了微服务网关服务cjtest_mic_gw做为后端服务，那么接下来只能在预发、线上环境里，绑定abs。


下图中，因为abs可以在预发环境进行绑定，因为尚未在此环境中绑定过。

![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-bondAPI.png) 

 

下图中，API分组abs将不再出现在测试环境下的可绑定的API分组列表中。因为已经存在过绑定关系。
 
![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-bondAPI-2.png) 

 
5、	发布操作：API分组发布生效后才能提供微服务应用的访问。

![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-fb-jdsf.png) 

 

6、	下线操作：分组在某一环境下线后（如在预发环境下线），该环境将不再提供服务访问。

![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-xxAPI.png) 

 
 
7、	解绑操作：解除API网关分组与微服务网关服务的关系。在部署环境中的分组为已发布状态，不能直接解绑，需要先下线分组再进行解绑操作。
 
![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/jdsfgw-unbondAPI.png) 

 







