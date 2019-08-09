# 京东云基础介绍 

京东云是京东旗下的云计算综合服务提供商，拥有全球领先的云计算技术和完整的服务 平台。京东云依托京东集团在云计算、大数据、物联网和移动互联网应用等方面的长期业务 实践和技术积淀，致力于打造社会化的云服务平台，向全社会提供安全、专业、稳定、便捷 的专业云服务。

# 地域与可用区

京东云云主机机房分布在全球多个位置，这些位置称为地域。每个地域（region）都是一个独立的地理地域，每个地域都是完全独立的。 
京东云支持您在不同地域部署云业务，同时为了避免单地域部署可能带来的单点风险，建议在部署方案设计阶段考虑多地域多可用区部署。可用区（Availability Zone）是电力及网络之间互相独立的物理区域，相同可用区内的实例之间较之同地域不同可用区内实例之间的网络延时更小。同地域内不同可用区之间提供内网互通环境，可用区之间可做到故障隔离。 

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-Kingdee-KIS/Region-Introduction.png)

## 云主机

![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/VM.png)
云主机（Virtual Machines,VM）是京东云提供的一种基础计算服务单元，提供处理能力可弹性伸缩的计算服务。京东云提供超大内存云主机，独享 1464GB DDR4 内存，满足对数据交换速度和内存容量有极高要求的大型业务部署场景。支持官方镜像，客户私有镜像/共享镜像，和云市场第三方镜像等丰富镜像来源。

## 云数据库 RDS
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/RDS.png)
云数据库 RDS 是京东云基于全球广受欢迎的 MySQL, Percona, MariaDB, SQL Server, PostgreSQL 数据库提供的稳定可靠的云数据库服务。相比传统数据库，云数据库 RDS 易于部署、管理和扩展，默认支持主从热备架构，提供数据备份、故障恢复、监控等全套解决方案，彻底解决数据库运维的烦恼。

## 网络负载均衡
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/LB.png)
网络负载均衡（Network Load Balancer，简称 NLB）是京东云自主研发、专注四层业务服务的负载均衡产品，支持过亿并发连接和每秒百万级新建连接的高性能、低延时、会话保持等能力

## 云硬盘
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/Disk.png)
云硬盘是京东云为云主机提供的低时延、高持久性、高可靠的数据块级存储。云硬盘内的数据以多重实时副本的方式存储，避免因组件故障导致数据不可用，同
时为您提供高可用的数据存储服务。云硬盘容量可弹性扩展，您可以在几分钟内以低廉的价格扩充数据存储空间，并实现数据的持久化存储。云硬盘可以挂载到云硬盘所在数据中心的任何运行中的云主机上，云硬盘通常适合于需要频繁更新的数据（如文件系统、日志、数据库等），具有高可用、高可靠、高性能的特点。 

## 云镜像
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/image.png)
云镜像是实例运行环境的模板，包含操作系统和预装的软件以及相关配置。可以基于镜像启动任意数量实例，也可以根据需求从任意多个不同的镜像启动实例。

## 私有网络 
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/VPC.png)
京东云私有网络(Virtual Private Cloud，简称 VPC)，是您在京东公有云上自定义的逻辑隔离的网络空间，与您在数据中心搭建的传统网络类似，此私有网络空间由用户完全掌控，支持自定义网段划分、路由策略等。用户可以在 VPC 内创建和管理多种云产品，如云主机、负载均衡等，同时可配置网络内的资源连接 Internet。
另外，您可以通过 VPN\专线接入，打通您的 IDC 内网和京东云网络，实现应用的混合云部署，以及将应用平滑地迁移至云上。

## 资源编排
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/resource-orchestration.png)
资源编排是一项简化云计算资源管理和运维的服务。用户通过模板描述多个京东云资源的配置信息和依赖关系，通过模板创建资源栈，自动完成所有资源的创建和配置，以实现资源的统一管理和自动化运维等目的。 服务本身免费，仅收取所使用资源的费用：如云主机、公网 IP、云数据库实例等。 

## 对象存储服务
![image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/oss.png)
京东云对象存储（Object Storage Service，简称 OSS）是利用京东在分布式存储领域多年的深厚技术积累，为用户提供安全、稳定、海量、便捷的对象存储服务。
京东云对象存储提供包括文件上传、存储、下载、分发、在线处理在内的全系列产品，从几字节到数 TB 的数据，都能够为您提供完整的存储方案。 


# 金蝶KIS介绍 

金蝶KIS是面向小微企业量身打造的管理软件品牌，包含多个系列产品，以订单为主线，以 财务为核心，通过云之家、微信等移动终端实现对库存、生产、销售、采购、网店、门店等各经营环节的实时管控，帮助企业在做好内部管理的同时，轻松玩转互联网，创新商业模式，赢得更多商机。 
 
## 金蝶KIS旗舰版 
帮助中小型企业提供涵盖业务协同、全网会员、全网促销、电子商务、门店管理、移动应用、 WMS仓储及配送、供应链、财务、生产制造、人事管理领域的信息化管理工具，帮助小企业快速构建面向多渠道营销、多地点办公、多企业协同以及多终端应用的运营管理平台。 
 
## 金蝶KIS云专业版 
为小型工贸企业提供六大关键环节：采购管理、销售管理、生产管理、委外管理、仓存管理、 财务管理，全面实现财务、业务、税务一体化管理。 
 
## 金蝶KIS账务平台 
依托KIS标准化API接口，形成跨平台、跨网络的行业财务整体解决方案。广泛适用于中小企业，全名覆盖中小企业财务管理五大关键环节。 

## 金蝶KIS财务系列 
专门为中小企业及行政事业单位提供财务核算及管理工作的信息化解决方案。 通过网上订单实现快速订货、移动订货；客户需求和客户订单，无缝接入企业ERP系统；订 单执行情况、财务往来对账清晰明了；订单签收、商品退货换货完整实现。 快速收集渠道库存、渠道销量信息；实时掌控商品销售流向，把握市场动态；企业公告、销售策略及时发布，营销渠道共创共赢。

