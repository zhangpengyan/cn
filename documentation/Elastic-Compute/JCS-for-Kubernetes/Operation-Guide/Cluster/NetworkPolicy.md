
# 开启/关闭Network Policy

Network Policy用于定义集群内部Pod之间的网络隔离策略以及Pod与其他外部网络端点之间的网络隔离策略。京东云网络插件提供了Network Policy控制器支持，更多说明参考[Network Pollicy概述]()。

您可以在京东云控制台一键开启或关闭Network Policy。也可以在集群中[手动部署Network Policy 控制器]。

**操作说明**

 1. 开启Network Policy后，将在集群中以Daemonset的方式部署Network Policy 控制器，并且为Pod 配置基于CPU、内存的水平伸缩策略，详情参考[Network Policy部署说明]()；
 2. 关闭Network Policy后，集群中Network Policy控制器相关的部署将全部被移除；已经定义的网络隔离策略仍然有效；新定义的网络隔离策略不再生效；
 3. 集群运行状态处于错误、已删除或其他中间状态的集群不支持修改Network Policy状态；
 4. 集群处于运行状态，但集群没有处于running状态的Node节点时，Network Policy控制器组件也会被部署到集群，但是组件相关的Pod将处于pending状态；

**操作步骤：**

 1. 打开控制台，选择[弹性计算>>Kubernetes集群>>集群服务>>集群](https://cns-console.jdcloud.com/host/kubernetes/list);  
 2. 选择需要修改Network Policy状态的集群服务，点击集群名称进入集群详情页；  
 3. 在集群详情页【资源信息】Tab中，点击Network Policy开关，开启/关闭Network Policy。
