# describePod


## 描述
查询一个 pod 的详细信息


## 请求方式
GET

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**pod**|Pod| |
### Pod
|名称|类型|描述|
|---|---|---|
|**podId**|String|pod ID|
|**name**|String|pod 名称|
|**description**|String|描述信息，默认为空。|
|**az**|String|可用区|
|**hostname**|String|主机名|
|**instanceType**|String|pod 所需的计算资源规格|
|**restartPolicy**|String|pod重启策略|
|**terminationGracePeriodSeconds**|Integer|优雅关闭的时间|
|**vpcId**|String|主网卡所属vpcId|
|**subnetId**|String|主网卡所属子网的ID|
|**privateIpAddress**|String|主网卡主IP地址|
|**dnsConfig**|DnsConfig|pod内容器的/etc/resolv.conf配置 |
|**logConfig**|LogConfig|容器日志配置信息；默认会在本地分配10MB的存储空间|
|**hostAliases**|HostAlias[]|pod内容器的/etc/hosts配置|
|**volumes**|Volume[]|属于Pod的volume列表，提供挂载到containers上。|
|**containers**|Container[]|pod内的容器信息|
|**podStatus**|PodStatus|pod状态信息|
|**elasticIp**|ElasticIp|主网卡主IP关联的弹性IP规格|
|**primaryNetworkInterface**|NetworkInterfaceAttachment|主网卡配置信息|
|**charge**|Charge|计费配置；如不指定，默认计费类型是后付费-按使用时常付费|
|**createTime**|String|Pod创建时间|
### Charge
|名称|类型|描述|
|---|---|---|
|**chargeMode**|String|支付模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration|
|**chargeStatus**|String|费用支付状态，取值为：normal、overdue、arrear，normal表示正常，overdue表示已到期，arrear表示欠费|
|**chargeStartTime**|String|计费开始时间，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ|
|**chargeExpiredTime**|String|过期时间，预付费资源的到期时间，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ，后付费资源此字段内容为空|
|**chargeRetireTime**|String|预期释放时间，资源的预期释放时间，预付费/后付费资源均有此值，遵循ISO8601标准，使用UTC时间，格式为：YYYY-MM-DDTHH:mm:ssZ|
### NetworkInterfaceAttachment
|名称|类型|描述|
|---|---|---|
|**autoDelete**|Boolean|指明删除pod时是否删除网卡，默认True；当前只能是True|
|**deviceIndex**|Integer|设备Index，目前pod只支持一个网卡，所以只能设置为1|
|**attachStatus**|String|绑定状态|
|**attachTime**|String|绑定时间|
|**networkInterface**|InstanceNetworkInterface|网卡接口规范|
### InstanceNetworkInterface
|名称|类型|描述|
|---|---|---|
|**networkInterfaceId**|String|弹性网卡ID|
|**macAddress**|String|以太网地址|
|**vpcId**|String|虚拟网络ID|
|**description**|String|描述|
|**securityGroups**|SecurityGroupSimple[]|安全组列表|
|**sanityCheck**|Boolean|源和目标IP地址校验，取值为0或者1|
|**primaryIp**|NetworkInterfacePrivateIp|网卡主IP|
|**secondaryIps**|NetworkInterfacePrivateIp[]| |
### NetworkInterfacePrivateIp
|名称|类型|描述|
|---|---|---|
|**privateIpAddress**|String|私有IP的IPV4地址|
|**elasticIpId**|String|私有IP的IPV4地址|
|**elasticIpAddress**|String|弹性IP实例地址|
### SecurityGroupSimple
|名称|类型|描述|
|---|---|---|
|**groupId**|String|安全组ID|
|**groupName**|String|安全组名称|
### ElasticIp
|名称|类型|描述|
|---|---|---|
|**elasticIpId**|String|弹性ip的Id|
|**elasticIpAddress**|String|弹性ip地址|
### PodStatus
|名称|类型|描述|
|---|---|---|
|**phase**|String|pod当前状态|
|**reason**|String|（简要）pod处于当前状态的原因|
|**message**|String|pod处于当前状态原因的详细信息|
|**podIP**|String|IP address allocated to the pod. Routable at least within the cluster. Empty if not yet allocated.|
|**conditions**|PodCondition[]|Current service state of pod.|
|**startTime**|String|Pod生命周期开始的时间。|
### PodCondition
|名称|类型|描述|
|---|---|---|
|**lastProbeTime**|String|Last time we probed the condition.|
|**lastTransitionTime**|String|Last time the condition transitioned from one status to another.|
|**reason**|String|Unique, one-word, CamelCase reason for the condition's last transition.|
|**status**|String|Status is the status of the condition. Can be True, False, Unknown.|
|**message**|String|Human-readable message indicating details about last transition.|
|**conditionType**|String|Type is the type of the condition. Currently only Ready.|
### Container
|名称|类型|描述|
|---|---|---|
|**name**|String|容器名称|
|**command**|String[]|容器执行命令，如果不指定默认是docker镜像的ENTRYPOINT。总长度256个字符。|
|**args**|String[]|容器执行命令的参数，如果不指定默认是docker镜像的CMD。总长度2048个字符。|
|**env**|EnvSpec[]|容器执行的环境变量；如果和镜像中的环境变量Key相同，会覆盖镜像中的值。长度范围：[0-100]|
|**image**|String|镜像名称 </br> 容器镜像名字。 nginx:latest。长度范围：[1-500] 1. Docker Hub官方镜像通过类似nginx, mysql/mysql-server的名字指定 </br> 2. repository长度最大256个字符，tag最大128个字符，registry最大255个字符 </br>|
|**secret**|String|镜像仓库secret名字。如果目前不传，默认选择dockerHub镜像|
|**tty**|Boolean|容器是否分配tty。默认不分配|
|**workingDir**|String|容器的工作目录。如果不指定，默认是根目录（/）；必须是绝对路径；长度范围：[0-1024]|
|**livenessProbe**|ProbeSpec|容器存活探针配置|
|**readinessProbe**|ProbeSpec|容器服务就绪探针配置|
|**resources**|ResourceRequestsSpec|容器计算资源配置|
|**systemDisk**|CloudDiskSpec|容器计算资源配置|
|**volumeMounts**|VolumeMount[]|容器计算资源配置|
|**containerStatus**|ContainerStatus|容器状态信息|
### ContainerStatus
|名称|类型|描述|
|---|---|---|
|**name**|String|容器名称|
|**restartCount**|Integer|容器被重新启动的次数|
|**ready**|Boolean|容器是否通过了就绪探针探测|
|**state**|ContainerState|关于容器当前状态详细信息|
|**lastState**|ContainerState|关于容器最后一次termination详细信息|
### ContainerState
|名称|类型|描述|
|---|---|---|
|**running**|ContainerStateRunning|容器running的详细信息|
|**terminated**|ContainerStateTerminated|容器Terminated的详细信息|
|**waiting**|ContainerStateWaiting|容器waiting的详细信息|
### ContainerStateWaiting
|名称|类型|描述|
|---|---|---|
|**reason**|String|（简要）容器还没有运行原因。<br><br>eg ContainerCreating     <br>|
|**message**|String|容器还没有运行的详细信息。|
### ContainerStateTerminated
|名称|类型|描述|
|---|---|---|
|**signal**|Integer|容器被termination的信号。|
|**exitCode**|Integer|容器被termination的退出码。|
|**reason**|String|（简要）容器被termination的原因。|
|**message**|String|容器被termination的详细信息。|
|**finishedAt**|String|容器被termination的时间。|
|**startedAt**|String|容器开始执行的时间。|
### ContainerStateRunning
|名称|类型|描述|
|---|---|---|
|**startedAt**|String|容器最后一次重启或启动的时间。|
### VolumeMount
|名称|类型|描述|
|---|---|---|
|**name**|String|必须使用pod volume名称|
|**mountPath**|String|容器内挂载点，绝对路径，不得重复和嵌套挂载，不得挂载到根目录("/")。长度范围：[1-1024]|
|**readOnly**|Boolean|是否以只读方式挂载。默认 读写模式|
### CloudDiskSpec
|名称|类型|描述|
|---|---|---|
|**volumeId**|String|云盘id，使用已有云盘|
|**name**|String|云盘名称|
|**snapshot**|String|云盘快照id，根据云盘快照创建云盘。|
|**diskType**|String|云盘类型：ssd,premium-hdd,hdd.std1,ssd.gp1,ssd.io1|
|**sizeGB**|Integer|云盘size,单位 GB,要求|
|**fsType**|String|指定volume文件系统类型，目前支持[xfs, ext4]；如果新创建的盘，不指定文件系统类型默认格式化成xfs|
|**autoDelete**|Boolean|是否随pod删除。默认：true|
### ResourceRequestsSpec
|名称|类型|描述|
|---|---|---|
|**requests**|RequestSpec|容器必需的计算资源|
|**limits**|RequestSpec|容器使用计算资源上限|
### RequestSpec
|名称|类型|描述|
|---|---|---|
|**cpu**|String|容器必需的计算资源|
|**memoryMB**|String|容器使用计算资源上限|
### ProbeSpec
|名称|类型|描述|
|---|---|---|
|**initialDelaySeconds**|Integer|容器启动多长时间后，触发探针。默认值：10秒；范围:[0-300]|
|**periodSeconds**|Integer|探测的时间间隔。默认值 10秒，范围:[1-300]|
|**timeoutSeconds**|Integer|探测的超时时间。默认值 1秒；范围:[1-300]|
|**failureThreshold**|Integer|在成功状态后，连续探活失败的次数，认为探活失败。默认值 3次；范围 1-10|
|**successThreshold**|Integer|在失败状态后，连续探活成功的次数，认为探活成功。默认值 1次；范围 1-10|
|**exec**|Exec|在容器内执行指定命令；如果命令退出时返回码为 0 则认为诊断成功。|
|**httpGet**|Hg|对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。<br><br>如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。 <br>|
|**tcpSocket**|TcpSocketSpec|对指定端口上的容器的 IP 地址进行 TCP 检查；如果端口打开，则诊断被认为是成功的。|
### TcpSocketSpec
|名称|类型|描述|
|---|---|---|
|**port**|Integer|范围：[1-65535]|
### Hg
|名称|类型|描述|
|---|---|---|
|**scheme**|String|默认值： http；可选值 http, https|
|**host**|String|连接到pod的host信息，默认使用pod_ip，满足hostname或者ipv4格式|
|**port**|Integer|范围：[1-65535]|
|**path**|String|HTTP的路径。范围：[1-256]|
|**httpHeader**|Hh[]|对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。<br><br>如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。 |
### Hh
|名称|类型|描述|
|---|---|---|
|**name**|String|http header key，需满足http的规则|
|**value**|String|容器探活方式|
### Exec
|名称|类型|描述|
|---|---|---|
|**command**|String[]|执行的命令,总长度256个字符。 s|
### EnvSpec
|名称|类型|描述|
|---|---|---|
|**name**|String|环境变量名称（ASCII）。范围：[1-64]。必须为字母、数字、下划线()，正则为`[a-zA-Z0-9]*$`。|
|**value**|String|环境变量取值。范围：[0-1024]|
### Volume
|名称|类型|描述|
|---|---|---|
|**name**|String|volume名字，必须是DNS_LABEL，在一个Pod是唯一的。|
|**jdcloudDisk**|JDCloudVolumeSource|提供给Pod的cloud disk.|
### JDCloudVolumeSource
|名称|类型|描述|
|---|---|---|
|**volumeId**|String|云盘id，使用已有云盘|
|**name**|String|云盘名称|
|**snapshot**|String|云盘快照id，根据云盘快照创建云盘。|
|**diskType**|String|云盘类型：ssd,premium-hdd,hdd.std1,ssd.gp1,ssd.io1|
|**sizeGB**|Integer|云盘size,单位 GB,要求|
|**fsType**|String|指定volume文件系统类型，目前支持[xfs, ext4]；如果新创建的盘，不指定文件系统类型默认格式化成xfs|
|**formatVolume**|Boolean|随容器自动创建的新盘，会自动格式化成指定的文件系统类型；挂载已有的盘，默认不会格式化，只会按照指定的fsType去挂载；如果希望格式化，必须设置此字段为true|
|**autoDelete**|Boolean|是否随pod删除。默认：true|
### HostAlias
|名称|类型|描述|
|---|---|---|
|**hostnames**|String[]|域名列表。<br><br>eg  ["foo.local", "bar.local"]。长度范围 1-10; 元素符合hostname命名规范。<br>|
|**ip**|String|ipv4信息；eg "127.0.0.1"|
### LogConfig
|名称|类型|描述|
|---|---|---|
|**logDriver**|String|日志Driver名称，目前只支持默认为每一个容器在本地分配10MB的存储空间，自动rotate。默认值：default。|
### DnsConfig
|名称|类型|描述|
|---|---|---|
|**nameservers**|String[]|DNS服务器IP地址列表，重复的将会被移除。<br><br>eg ["8.8.8.8", "4.2.2.2"]。列表长度：[0-20]，元素符合IPv4格式。<br>|
|**searches**|String[]|DNS搜索域列表，用于主机名查找。<br><br>eg ["ns1.svc.cluster.local", "my.dns.search.suffix"]。列表长度：[0-6]，列表中所有字符总长度不超过256个。<br>|
|**options**|PodDnsConfigOption[]|DNS解析器选项列表。<br><br>eg  ["ndots":"2", "edns0":""]。列表长度：[0-10]|
### PodDnsConfigOption
|名称|类型|描述|
|---|---|---|
|**name**|String|长度范围：[1-63]，需满足linux resolver限制|
|**value**|String|长度范围：[0-100]，仅限timeout, attempts, ndots|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
