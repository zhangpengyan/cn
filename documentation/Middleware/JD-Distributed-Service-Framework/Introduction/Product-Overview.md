
# 产品概述

京东云微服务平台（JDCloud Distributed Service Framework，简称JDSF)是一种托管的服务治理框架，围绕微服务的整个生命周期，提供服务部署、注册、发现、调用、监控等全方位功能，方便用户实施Spring Cloud、Dubbo等微服务应用。使用原生的Spring Cloud包即可连接微服务平台的注册中心、配置中心和调用链分析服务；依托京东云同城多机房网络高速互联的基础设施，该产品所有组件都具备跨机房的高可用性，使用者无需再担心雷击、挖断光缆等各种异常导致的服务中断。


##### 说明: 
本产品已开放公测，期间免费使用。公测版本即是正式稳定的服务版本，用户不必担心稳定性与安全性问题，请放心试用。公测期结束后，产品将按实例的规格付费，并且不必重新开通新服务或切换服务。


## 常用操作


	
- 注册中心管理
	- [新建注册中心](../Operation-Guide/Cluster/Create-Cluster.md)
	- [删除注册中心](../Operation-Guide/Cluster/Delete-Cluster.md)
	- [扩缩容](../Operation-Guide/Cluster/Expansion-Cluster.md)
- 服务管理
	- [服务管理列表](../Operation-Guide/Service-List/Service-List.md)	
	- [实例管理列表](../Operation-Guide/Service-List/Instance-List.md)	
- 调用链分析服务
	- [新建分析服务](../Operation-Guide/Analysis-Service/Create-Analysis-Service.md)
	- [删除分析服务](../Operation-Guide/Analysis-Service/del-Analysis-Service.md)
	- [修改服务](../Operation-Guide/Analysis-Service/Update-Analysis-Service.md)
- 微服务网关
	- [微服务网关介绍](../Operation-Guide/JDSFGW/overview.md)
	- [使用API网关开放VPC内的接口](../Getting-Started/GW_VPC.md)
	- [新建服务](../Operation-Guide/JDSFGW/CreateGW.md)





## 计费
微服务平台针对注册中心和调用链分析服务分别计费，价格与所选择的服务实例规格相关。配置管理服务依托注册中心，使用免费。目前产品在公测阶段，所有服务完全免费。

详细说明请参见：[计费说明](../Pricing/Billing-Overview.md)。


## 支持的地域和可用区列表
|地域|地域标示|可用区|可用区标示|
|---|---|---|---|
|华北-北京|cn-north-1|可用区A|cn-north-1a|
|华北-北京|cn-north-1|可用区B|cn-north-1b|
|华北-北京|cn-north-1|可用区C|cn-north-1c|
|华东-上海|cn-east-2|可用区A|cn-east-2a|
|华东-上海|cn-east-2|可用区B|cn-east-2b|
|华东-上海|cn-east-2|可用区C|cn-east-2c|
