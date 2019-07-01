
# 核心概念

| 概念    |    解释 |
| --- | --- |
|    集群 |    Kubernetes集群运行所需云资源的集合，包含云服务器、云硬盘、公网IP、负载均衡器等京东云云资源。 |
|  管理节点   |一台已经安装了kube-apiserver, kube-controller-manager 和 kube-schedule等Kubernetes管理组件的实例。     |
|  工作节点   |一台已经安装了容器运行时（京东云使用docker Engine）、Kubelet、网络插件等Kubernetes组件的云主机实例，实例必须先注册到某一个集群上，状态为可用时，才可以用于部署和管理容器化应用。     |
|工作节点组     |  一组具有相同实例规格配置的工作节点集合。   |  
 
Kubernetes 相关概念  
Kubernetes是一个用于自动部署、扩展和管理容器化应用的大规模容器编排调度系统。具有可移植、可扩展和自动调度等特性。  

|   概念  |解释     |
| --- | --- |
| 节点（Master）    |  Kubernetes 集群中的管理能力由 Master 提供，Kubernetes集群中的Master运行APIServer、ControllerManager、Etcd等集群核心组件；一个Master节点对应京东云集群中的一个管理节点。   |
| 节点（Node）    |  Kubernetes 集群中的计算能力由 Node 提供，Kubernetes 集群中的 Node 是所有 Pod 运行所在的工作主机，可以是物理机也可以是虚拟机；一个Node节点对应京东云集群中一个工作节点。   |
|  Pod   |   	Kubernetes创建或部署的最小/最简单的基本单位，一个Pod代表集群上正在运行的一个进程，可以运行单个容器也可以运行多个需要一起工作的容器，多个容器内一般封装紧密耦合的应用，容器间共享内核、网络、文件系统。  |
|  StatefulSet   |   	StatefulSet保证Pod部署和伸缩的顺序，解决有状态服务的问题，即Pod重新调度后PodName和HostName不变，且能访问到相同的持久化数据，在部署、扩展的时候依据定义的顺序依次依次进行（即从0到N-1），有序收缩、删除（即从N-1到0）。  |
|  DaemonSet  |   	确保全部（或者一些）Node 上运行一个 Pod 的副本。当有 Node 加入集群时，也会为他们新增一个 Pod 。当有 Node 从集群移除时，这些 Pod 也会被回收。删除 DaemonSet 将会删除它创建的所有 Pod，典型应用包括集群存储daemon、日志收集daemon、监控daemon。  |
|  Job   |   	Job负责批处理任务，即仅执行一次的任务，它保证批处理任务的一个或多个Pod成功结束。  |
|  CronJob   |   	Cron Job 管理基于时间的 Job，它根据指定的预定计划周期性地运行一个 Job。  |
|  Service   |   	一个Pod的逻辑分组，定义了Pod的访问策略，对集群中的应用，Kubernetes 提供了简单的 Endpoints API，只要 Service 中的一组 Pod 发生变更，应用程序就会被更新。 对非 Kubernetes 集群中的应用，Kubernetes 提供了基于 VIP 的网桥的方式访问 Service，再由 Service 重定向到 backend Pod。  |
|  Job   |   	Job负责批处理任务，即仅执行一次的任务，它保证批处理任务的一个或多个Pod成功结束。  |
|   Ingress	  | Ingress 是从Kubernetes集群外部访问集群内部服务的入口，提供入站连接到达集群服务的规则集合，你可以给Ingress配置提供外部可访问的URL、负载均衡、SSL、基于名称的虚拟主机等。用户通过POST Ingress资源到API server的方式来请求ingress。 |
|  ConfigMap   |   ConfigMap用来保存key-value pair配置数据，可以被用来保存单个属性，也可以用来保存一个配置文件。 配置数据在Pods里被使用，典型使用场景包括设置环境变量的值、在容器里设置命令行参数或在数据卷里面创建config文件。  |
|  Volume   |   	Kubernetes 的存储卷的生命周期和作用范围是一个 Pod。每个 Pod 中声明的存储卷由 Pod 中的所有容器共享。支持使用 Persistent Volume Claim 即 PVC 这种逻辑存储。  |
|  Persistent Volume（PV）/Persistent Volume Claim（PVC）   |   	PV 和 PVC 使得 Kubernetes 集群具备了存储的逻辑抽象能力，使得在配置 Pod 的逻辑里可以忽略对实际后台存储技术的配置，而把这项配置的工作交给 PV 的配置者。PV 是资源的提供者，根据集群的基础设施变化而变化，由 Kubernetes 集群管理员配置；而 PVC 是资源的使用者，根据业务服务的需求变化而变化，由 Kubernetes 集群的使用者即服务的管理员来配置；目前京东云支持使用云硬盘作为PV。  |

