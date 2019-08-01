# Network Policy 概述

[基本概念](#基本概念)

Network Policy用于定义集群内部Pod之间的网络隔离策略以及Pod与其他外部网络端点之间的网络隔离策略。Network Policy的定义由网络插件提供的控制器实现。更多详情参考[Kubernetes.io](https://kubernetes.io/docs/concepts/services-networking/network-policies/)。

默认情况下，pod之间无隔离，能够接收任何来源的流量；因此，如果您需要在集群中为Pod定义隔离策略，您可以选择在集群中开启Network Policy。

[部署说明](#部署说明)

京东云的Network Policy控制器通过集成Calico的Felix组件实现.支持基于Kubernetes标准API的NetworkPolicy来定义容器间的访问策略，并且兼容[Calico](https://docs.projectcalico.org/v3.8/security/calico-network-policy)的Network Policy。 

您可以在创建集群时选择[开启Network Policy]()；也可以为已有集群[开启Network Policy]()。

开启后Network Policy后，集群中增加的组件，组件yaml定义，组件的作用（待补充）。
工作原理说明（待补充）。
初始组件的资源定义适用的集群规模（待补充）。
京东云为Network Policy提供了伸缩策略，策略说明如下（待补充）。

更多Network Policy相关的应用实践参考[文档名称]()。


  
