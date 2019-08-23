# pod


## 简介
pod 服务


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**associateElasticIp**|POST|pod 绑定弹性公网 IP，绑定的是主网卡、主内网IP对应的弹性IP. <br>一个 pod 只能绑定一个弹性公网 IP(主网卡)，若主网卡已存在弹性公网IP，会返回错误。<br>如果是黑名单中的用户，会返回错误。<br>|
|**attach**|GET|将容器连接到本地标准输入输出<br>|
|**checkPodName**|POST|podName 是否符合命名规范，以及查询指定 podName 区域内是否已经存在。<br>|
|**createPods**|POST|创建一台或多台 pod<br>- 创建pod需要通过实名认证<br>- hostname规范<br>    \- 支持两种方式：以标签方式书写或以完整主机名方式书写<br>    \- 标签规范<br>        \- 0-9，a-z(不分大小写)和-（减号），其他的都是无效的字符串<br>        \- 不能以减号开始，也不能以减号结尾<br>        \- 最小1个字符，最大63个字符<br>    \- 完整的主机名由一系列标签与点连接组成<br>        \- 标签与标签之间使用“.”(点)进行连接<br>        \- 不能以“.”(点)开始，也不能以“.”(点)结尾<br>        \- 整个主机名（包括标签以及分隔点“.”）最多有63个ASCII字符<br>    - 网络配置<br>    \- 指定主网卡配置信息<br>        \- 必须指定subnetId<br>        \- 可以指定elasticIp规格来约束创建的弹性IP，带宽取值范围[1-100]Mbps，步进1Mbps<br>        \- 可以指定网卡的主IP(primaryIpAddress)和辅助IP(secondaryIpAddresses)，此时maxCount只能为1<br>        \- 可以设置网卡的自动删除autoDelete属性，指明是否删除实例时自动删除网卡<br>        \- 安全组securityGroup需与子网Subnet在同一个私有网络VPC内<br>        \- 一个 pod 创建时至多指定5个安全组<br>        \- 主网卡deviceIndex设置为1<br>- 存储<br>    \- volume分为container system disk和pod data volume，container system disk的挂载目录是/，data volume的挂载目录可以随意指定<br>    \- container system disk<br>        \- 只能是cloud类别<br>        \- 云硬盘类型可以选择hdd.std1、ssd.gp1、ssd.io1<br>        \- 磁盘大小<br>            \- 所有类型：范围[20,100]GB，步长为10G<br>        \- 自动删除<br>            \- 默认自动删除<br>        \- 可以选择已存在的云硬盘<br>    \- data volume<br>        \- 当前只能选择cloud类别<br>        \- 云硬盘类型可以选择hdd.std1、ssd.gp1、ssd.io1<br>        \- 磁盘大小<br>            \- 所有类型：范围[20,4000]GB，步长为10G<br>        \- 自动删除<br>            \- 默认自动删除<br>        \- 可以选择已存在的云硬盘<br>        \- 可以从快照创建磁盘<br>- pod 容器日志<br>    \- default：默认在本地分配10MB的存储空间，自动rotate<br>- DNS-1123 label规范<br>    \- 长度范围: [1-63]<br>       \- 例子: my-name, 123-abc<br>- DNS-1123 subdomain规范<br>    \- 长度范围: [1-253]<br>        \- 例子: example.com, registry.docker-cn.com<br>- 其他<br>    \- 创建完成后，pod 状态为running<br>    \- maxCount为最大努力，不保证一定能达到maxCount<br>|
|**createSecret**|POST|创建一个 secret，用于存放镜像仓库机密相关信息。<br>|
|**deletePod**|DELETE|pod 状态必须为 stopped、running 或 error状态。 <br>按量付费的实例，如不主动删除将一直运行，不再使用的实例，可通过本接口主动停用。<br>只能支持主动删除按量计费类型的实例。包年包月过期的 pod 也可以删除，其它的情况还请发工单系统。计费状态异常的容器无法删除。<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
|**deleteSecret**|DELETE|删除单个 secret<br>|
|**describeContainer**|GET|获取 pod 中某个容器的详情|
|**describeInstanceTypes**|GET|查询实例规格信息列表<br>|
|**describePod**|GET|查询一个 pod 的详细信息<br>|
|**describePods**|GET|批量查询 pod 的详细信息<br>此接口支持分页查询，默认每页20条。<br>|
|**describeQuota**|GET|查询资源的配额，支持：原生容器 pod 和 secret.<br>|
|**describeSecret**|GET|查询单个 secret 详情<br>|
|**describeSecrets**|GET|查询 secret 列表。<br> <br>此接口支持分页查询，默认每页20条。<br>|
|**disassociateElasticIp**|POST|pod 解绑公网 IP，解绑的是主网卡、主内网 IP 对应的弹性 IP.<br>|
|**execCreate**|POST|创建 exec<br>|
|**execGetExitCode**|GET|获取exec退出码|
|**execStart**|GET|执行exec，此接口需要升级Http协议到WebSocket|
|**getContainerLogs**|GET|查询单个容器日志<br>|
|**modifyPodAttribute**|PATCH|修改 pod 的描述。<br>|
|**rebuildPod**|POST|对 pod 中的容器使用新的镜像进行重置，pod 需要处于关闭状态。<br>|
|**resizeTTY**|POST|设置TTY大小|
|**startPod**|POST|启动处于关闭状态的单个 pod ，处在任务执行中的 pod 无法启动。<br>pod 实例或其绑定的云盘已欠费时，容器将无法正常启动。<br>|
|**stopPod**|POST|停止处于运行状态的单个实例，处于任务执行中的 pod 无法启动。<br>|
