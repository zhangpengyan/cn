# 京东云基础介绍 

京东云是京东旗下的云计算综合服务提供商，拥有全球领先的云计算技术和完整的服务平台。京东云依托京东集团在云计算、大数据、物联网和移动互联网应用等方面的长期业务实践和技术积淀，致力于打造社会化的云服务平台，向全社会提供安全、专业、稳定、便捷的专业云服务。 

## 1 地域与可用区


京东云云主机机房分布在全球多个位置，这些位置称为地域。每个地域（region）都是一个独立的地理地域，每个地域都是完全独立的。 
京东云支持您在不同地域部署云业务，同时为了避免单地域部署可能带来的单点风险，建议在部署方案设计阶段考虑多地域多可用区部署。可用区（Availability Zone）是电力及网络之间互相独立的物理区域，相同可用区内的实例之间较之同地域不同可用区内实例之间的网络延时更小。同地域内不同可用区之间提供内网互通环境，可用区之间可做到故障隔离。 
高可用组(AG)是京东云提供的业务高可用部署解决方案，是计算资源逻辑集合。提供了组内单元在数据中心内横跨多个故障域（Fault Domain，简称 FD)均衡部署的机制，示例分散部署在相互隔离的物理资源上，当出现硬件故障或定时维护时只会影响部分实例，您的业务仍为可用状态。故障域间故障隔离，最大程度规避了局部故障对高可用应用整体的影响。 

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/Region-Introduction.png)


## 2 云主机

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/VM.png)
云主机（Virtual Machines,VM）是京东云提供的一种基础计算服务单元，提供处理能力可弹性伸缩的计算服务。京东云提供超大内存云主机，独享 1464GB DDR4 内存，满足对数据交换速度和内存容量有极高要求的大型业务部署场景。支持官方镜像，客户私有镜像/共享镜像，和云市场第三方镜像等丰富镜像来源。 


## 3 云数据库 RDS 

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/RDS.png)
云数据库 RDS 是京东云基于全球广受欢迎的 MySQL, Percona, MariaDB, SQL Server, PostgreSQL 数据库提供的稳定可靠的云数据库服务。相比传统数据库，云数据库 RDS 易于部署、管理和扩展，默认支持主从热备架构，提供数据备份、故障恢复、监控等全套解决方案，彻底解决数据库运维的烦恼。


## 4 网络负载均衡

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/LB.png)
网络负载均衡（Network Load Balancer，简称 NLB）是京东云自主研发、专注四层业务服务的负载均衡产品，支持过亿并发连接和每秒百万级新建连接的高性能、低延时、会话保持等能力。 


## 5 云硬盘

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/Disk.png
云硬盘是京东云为云主机提供的低时延、高持久性、高可靠的数据块级存储。云硬盘内的数据以多重实时副本的方式存储，避免因组件故障导致数据不可用，同时为您提供高可用的数据存储服务。云硬盘容量可弹性扩展，您可以在几分钟内以低廉的价格扩充数据存储空间，并实现数据的持久化存储。云硬盘可以挂载到云硬盘所在数据中心的任何运行中的云主机上，云硬盘通常适合于需要频繁更新的数据（如文件系统、日志、数据库等），具有高可用、高可靠、高性能的特点。


## 6 云镜像

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/image.png)
云镜像是实例运行环境的模板，包含操作系统和预装的软件以及相关配置。可以基于镜像启动任意数量实例，也可以根据需求从任意多个不同的镜像启动实例。 


## 7 私有网络

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/VPC.png)
京东云私有网络(Virtual Private Cloud，简称 VPC)，是您在京东公有云上自定义的逻辑隔离的网络空间，与您在数据中心搭建的传统网络类似，此私有网络空间由用户完全掌控，支持自定义网段划分、路由策略等。用户可以在 VPC 内创建和管理多种云产品，如云主机、负载均衡等，同时可配置网络内的资源连接 Internet。另外，您可以通过 VPN\专线接入，打通您的 IDC 内网和京东云网络，实现应用的混合云部署，以及将应用平滑地迁移至云上。

## 8 资源编排 

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/resource-orchestration.png)
资源编排是一项简化云计算资源管理和运维的服务。用户通过模板描述多个京东云资源的配置信息和依赖关系，通过模板创建资源栈，自动完成所有资源的创建和配置，以实现资源的统一管理和自动化运维等目的。 服务本身免费，仅收取所使用资源的费用：如云主机、公网 IP、云数据库实例等。 

## 9 对象存储服务

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Yonyou-U8Plus/oss.png)
京东云对象存储（Object Storage Service，简称 OSS）是利用京东在分布式存储领域多年的深厚技术积累，为用户提供安全、稳定、海量、便捷的对象存储服务。
京东云对象存储提供包括文件上传、存储、下载、分发、在线处理在内的全系列产品，从几字节到数 TB 的数据，都能够为您提供完整的存储方案。
