#	京东云基础介绍 

京东云是京东旗下的云计算综合服务提供商，拥有全球领先的云计算技术和完整的服务平台。京东云依托京东集团在云计算、大数据、物联网和移动互联网应用等方面的长期业务实践和技术积淀，致力于打造社会化的云服务平台，向全社会提供安全、专业、稳定、便捷的专业云服务。

# 地域与可用区

京东云云主机机房分布在全球多个位置，这些位置称为地域。每个地域（region）都是一个独立的地理地域，每个地域都是完全独立的。 
京东云支持您在不同地域部署云业务，同时为了避免单地域部署可能带来的单点风险，建议在部署方案设计阶段考虑多地域多可用区部署。可用区（Availability Zone）是电力及网络之间互相独立的物理区域，相同可用区内的实例之间较之同地域不同可用区内实例之间的网络延时更小。同地域内不同可用区之间提供内网互通环境，可用区之间可做到故障隔离。 

[!image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/Region-Introduction.png)

## 云主机

[!image](../../../image/JDCloud-WhitePaper/JDCloud-WhitePaper-Best-Practice-with-QiTongZhiNeng-Smart-Manufacturing/VM.png)
云主机（Virtual Machines,VM）是京东云提供的一种基础计算服务单元，提供处理能力可弹性伸缩的计算服务。京东云提供超大内存云主机，独享 1464GB DDR4 内存，满足对数据交换速度和内存容量有极高要求的大型业务部署场景。支持官方镜像，客户私有镜像/共享镜像，和云市场第三方镜像等丰富镜像来源。

