# 版本说明  
  
## Kubernetes 社区版本  
- Kubernetes 社区版本以x.y.z标识，其中x表示Major版本，y表示Minor版本，z表示Patch版本，版本说明如下：Major版本一般表示不具有兼容性的API变更；Minor版本表示功能变更，一般向后兼容；Patch版本表示向后兼容的Bug修复
- 京东云基于Kubernetes社区版本提供京东云的Kubernetes集群版本，版本以x.y.z-jcs.N标识 ，每一个Minor版本提供2-3个稳定的Patch版本，京东云将根据确定上线支持的Patch版本，但不保证Patch版本的连续性。-jcs.N后缀标识京东云基于某一Patch版本提供的特殊分支，包含安全更新、Bug修复或功能升级等，由京东云保证版本可用性。
  
## 京东云支持的Kubernetes版本  
  
### 1.8  
#### 版本说明:  
京东云Kubernetes集群1.8版本已下线，下线后将不再基于1.8版本提供功能升级，为保证集群可用性和稳定性，请您选择新版可用集群进行测试、升级；

#### 社区版支持的新特性说明：  
- 聚焦安全性：基于角色的访问控制（RBAC）成为stable支持。RBAC允许集群管理员动态定义角色对于Kubernetes API的访问策略。通过网络策略筛选出站流量的Beta支持，增强了对入站流量进行过滤的现有支持。 RBAC和网络策略是强化Kubernetes内组织和监管安全要求的两个强大工具。Kubelet的传输层安全性（TLS）证书轮换成为beta版。自动证书轮换减轻了集群安全性运维的负担。  
- 聚焦工作负载支持：Kubernetes 1.8通过apps/v1beta2组和版本推动核心工作负载API的beta版本。Beta版本包含当前版本的Deployment、DaemonSet、ReplicaSet和StatefulSet。 工作负载API是将现有工作负载迁移到Kubernetes以及开发基于Kubernetes的云原生应用程序提供了基石。  
## 1.12  

#### 版本说明：  
- 1.12社区版于2018.9月正式GA。且该版本是目前京东云Kubernetes集群支持的最新版本  
#### 社区版支持的新特性说明：  
- Kubelet TLS Bootstrap GA：此功能允许kubelet将自身引导至TLS安全集群。最重要的是，它可以自动提供和分发签名证书。除此之外，Kubelet服务器证书引导程序和轮换正在转向测试版。目前，当kubelet首次启动时，它会生成一个自签名证书/密钥对，用于接受传入的TLS连接。此功能引入了一个在本地生成密钥，然后向集群API server发出证书签名请求以获取由集群的根证书颁发机构签名的关联证书的过程。此外，当证书接近过期时，将使用相同的机制来请求更新的证书。  
- RuntimeClass是一个新的集群作用域资源，它将容器运行时属性表示为作为alpha功能发布的控制平面。  
- Kubernetes和CSI的快照/恢复功能正在作为alpha功能推出。这提供了标准化的API设计（CRD），并为CSI卷驱动程序添加了PV快照/恢复支持。  
- 拓扑感知动态配置现在处于测试阶段，存储资源现在可以感知自己的位置。  
- 可配置的pod进程命名空间共享处于测试阶段，用户可以通过在PodSpec中设置选项来配置pod中的容器以共享公共PID命名空间。  
- 根据条件的taint节点现在处于测试阶段，用户可以通过使用taint来表示阻止调度的节点条件。  
- Horizontal Pod Autoscaler中的任意/自定义指标正在转向第二个测试版，以测试一些其他增强功能。这项重新设计的Horizontal Pod Autoscaler功能包括对自定义指标和状态条件的支持。  
- 允许Horizontal Pod Autoscaler更快地达到适当大小正在转向测试版。  
- Pod的垂直缩放现在处于测试阶段，使得可以在其生命周期内改变pod上的资源限制。  
- 通过KMS进行静态加密目前处于测试阶段。  
