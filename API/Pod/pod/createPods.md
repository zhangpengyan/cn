# createPods


## 描述
创建一台或多台 pod
- 创建pod需要通过实名认证
- hostname规范
    - 支持两种方式：以标签方式书写或以完整主机名方式书写
    - 标签规范
        - 0-9，a-z(不分大小写)和-（减号），其他的都是无效的字符串
        - 不能以减号开始，也不能以减号结尾
        - 最小1个字符，最大63个字符
    - 完整的主机名由一系列标签与点连接组成
        - 标签与标签之间使用“.”(点)进行连接
        - 不能以“.”(点)开始，也不能以“.”(点)结尾
        - 整个主机名（包括标签以及分隔点“.”）最多有63个ASCII字符
- 网络配置
    - 指定主网卡配置信息
        - 必须指定subnetId
        - 可以指定elasticIp规格来约束创建的弹性IP，带宽取值范围[1-100]Mbps，步进1Mbps
        - 可以指定网卡的主IP(primaryIpAddress)和辅助IP(secondaryIpAddresses)，此时maxCount只能为1
        - 可以设置网卡的自动删除autoDelete属性，指明是否删除实例时自动删除网卡
        - 安全组securityGroup需与子网Subnet在同一个私有网络VPC内
        - 一个 pod 创建时至多指定5个安全组
        - 主网卡deviceIndex设置为1
- 存储
    - volume分为container system disk和pod data volume，container system disk的挂载目录是/，data volume的挂载目录可以随意指定
    - container system disk
        - 只能是cloud类别
        - 云硬盘类型可以选择hdd.std1、ssd.gp1、ssd.io1
        - 磁盘大小
            - 所有类型：范围[20,100]GB，步长为10G
        - 自动删除
            - 默认自动删除
        - 可以选择已存在的云硬盘
    - data volume
        - 当前只能选择cloud类别
        - 云硬盘类型可以选择hdd.std1、ssd.gp1、ssd.io1
        - 磁盘大小
            - 所有类型：范围[20,4000]GB，步长为10G
        - 自动删除
            - 默认自动删除
        - 可以选择已存在的云硬盘
        - 可以从快照创建磁盘
- pod 容器日志
    - default：默认在本地分配10MB的存储空间，自动rotate
- DNS-1123 label规范
    - 长度范围: [1-63]
    - 例子: my-name, 123-abc
- DNS-1123 subdomain规范
    - 长度范围: [1-253]
    - 例子: example.com, registry.docker-cn.com
- 其他
    - 创建完成后，pod 状态为running
    - maxCount为最大努力，不保证一定能达到maxCount


## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**podSpec**|PodSpec|True| |pod 创建参数|
|**maxCount**|Integer|True| |购买实例数量；取值范围：[1,100]|
|**clientToken**|String|False| |保证请求幂等性的字符串；最大长度64个ASCII字符|

### PodSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |Pod名称|
|**description**|String|False| |描述信息，默认为空；允许输入UTF-8编码下的全部字符，不超过256字符。|
|**hostname**|String|False| |主机名；范围：[1-63]个ASCII字符，默认值为 podId|
|**restartPolicy**|String|False| |pod中容器重启策略；Always, OnFailure, Never；默认：Always|
|**terminationGracePeriodSeconds**|Integer|False| |优雅关机宽限时长，如果超时，则触发强制关机。默认：30s，值不能是负数，范围：[0-300]|
|**instanceType**|String|True| |实例类型；参考[文档](https://www.jdcloud.com/help/detail/1992/isCatalog/1)|
|**az**|String|True| |容器所属可用区|
|**dnsConfig**|DnsConfigSpec|False| |pod内容器的/etc/resolv.conf配置|
|**logConfig**|LogConfigSpec|False| |容器日志配置信息；默认会在本地分配10MB的存储空间|
|**hostAliases**|HostAliasSpec[]|False| |域名和IP映射的信息；</br> 最大10个alias|
|**volumes**|VolumeSpec[]|False| |Pod的volume列表，可以挂载到container上。长度范围：[0,7]|
|**containers**|ContainerSpec[]|True| |Pod的容器列表，至少一个容器。长度范围[1,8]|
|**charge**|ChargeSpec|False| |计费模式：包年包月预付费（prepaid_by_duration）, 按配置后付费（postpaid_by_duration）。默认：按配置后付费|
|**elasticIp**|ElasticIpSpec|False| |主网卡主IP关联的弹性IP规格|
|**primaryNetworkInterface**|NetworkInterfaceAttachmentSpec|True| |主网卡配置信息|
### NetworkInterfaceAttachmentSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**autoDelete**|Boolean|False| |指明删除pod时是否删除网卡，默认True；当前只能是True|
|**deviceIndex**|Integer|False| |设备Index，目前pod只支持一个网卡，所以只能设置为1|
|**networkInterface**|NetworkInterfaceSpec|True| |网卡接口规范|
### NetworkInterfaceSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**subnetId**|String|True| |子网ID|
|**az**|String|False| |可用区，用户的默认可用区，该参数无效，不建议使用|
|**networkInterfaceName**|String|False| |网卡名称，只允许输入中文、数字、大小写字母、英文下划线“_”及中划线“-”，不允许为空且不超过32字符。|
|**primaryIpAddress**|String|False| |网卡主IP，如果不指定，会自动从子网中分配|
|**secondaryIpAddresses**|String[]|False| |SecondaryIp列表|
|**secondaryIpCount**|Integer|False| |自动分配的SecondaryIp数量|
|**securityGroups**|String[]|False| |要绑定的安全组ID列表，最多指定5个安全组|
|**sanityCheck**|Integer|False| |源和目标IP地址校验，取值为0或者1,默认为1|
|**description**|String|False| |描述,​ 允许输入UTF-8编码下的全部字符，不超过256字符|
### ElasticIpSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bandwidthMbps**|Integer|True| |弹性公网IP的限速（单位：MB）|
|**provider**|String|False| |IP服务商，取值为bgp或no_bgp，默认：bgp|
|**chargeSpec**|ChargeSpec|False| |预付费（prepaid_by_duration）, 按配置后付费（postpaid_by_duration）。默认：按配置后付费|
### ChargeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**chargeMode**|String|False|postpaid_by_duration|计费模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration.请参阅具体产品线帮助文档确认该产品线支持的计费类型|
|**chargeUnit**|String|False| |预付费计费单位，预付费必填，当chargeMode为prepaid_by_duration时有效，取值为：month、year，默认为month|
|**chargeDuration**|Integer|False| |预付费计费时长，预付费必填，当chargeMode取值为prepaid_by_duration时有效。当chargeUnit为month时取值为：1~9，当chargeUnit为year时取值为：1、2、3|
### ContainerSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |容器名称，符合DNS-1123 label规范，在一个Pod内不能重复。|
|**command**|String[]|False| |容器执行命令，如果不指定默认是docker镜像的ENTRYPOINT。总长度256个字符。|
|**args**|String[]|False| |容器执行命令的参数，如果不指定默认是docker镜像的CMD。总长度2048个字符。|
|**env**|EnvSpec[]|False| |容器执行的环境变量；如果和镜像中的环境变量Key相同，会覆盖镜像中的值。数组范围：[0-100]|
|**image**|String|True| |镜像名称 </br><br>容器镜像名字。 nginx:latest。长度范围：[1-639]<br>1. Docker Hub官方镜像通过类似nginx, mysql/mysql-server的名字指定 </br> <br>2. repository长度最大256个字符，tag最大128个字符，registry最大255个字符 </br> <br>|
|**secret**|String|False| |镜像仓库认证信息。如果目前不传，默认选择dockerHub镜像|
|**tty**|Boolean|False| |容器是否分配tty。默认不分配|
|**workingDir**|String|False| |容器的工作目录。如果不指定，默认是根目录（/）；必须是绝对路径；长度范围：[0-1024]|
|**livenessProbe**|ProbeSpec|False| |容器存活探针配置|
|**readinessProbe**|ProbeSpec|False| |容器服务就绪探针配置|
|**resources**|ResourceRequestsSpec|False| |容器计算资源配置|
|**systemDisk**|CloudDiskSpec|True| |容器计算资源配置|
|**volumeMounts**|VolumeMountSpec[]|False| |云盘挂载信息|
### VolumeMountSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |要挂载的云盘，必须使用pod volumeSpec.name。|
|**mountPath**|String|True| |容器内挂载点，绝对路径，不得重复和嵌套挂载，不得挂载到根目录("/")。长度范围：[1-1024]|
|**readOnly**|Boolean|False| |是否以只读方式挂载。默认 读写模式|
### CloudDiskSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**volumeId**|String|False| |云盘ID，指定使用已有云盘|
|**name**|String|False| |云盘名称|
|**snapshotId**|String|False| |云盘快照ID，根据云盘快照创建云盘。|
|**diskType**|String|False| |云盘类型：hdd.std1,ssd.gp1,ssd.io1|
|**sizeGB**|Integer|False| |云盘size,单位 GB,要求|
|**fsType**|String|False| |指定volume文件系统类型，目前支持[xfs, ext4]；如果新创建的盘，不指定文件系统类型默认格式化成xfs|
|**iops**|Integer|False| |云盘的 iops 值，目前只有 ssd.io1 类型有效|
|**autoDelete**|Boolean|False| |是否随pod删除。默认：true|
### ResourceRequestsSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**requests**|RequestSpec|False| |容器必需的计算资源|
|**limits**|RequestSpec|False| |容器使用计算资源上限|
### RequestSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cpu**|String|False| |容器必需的计算资源|
|**memoryMB**|String|False| |容器使用计算资源上限|
### ProbeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**initialDelaySeconds**|Integer|False| |容器启动多长时间后，触发探针。默认值：10秒；范围:[0-300]|
|**periodSeconds**|Integer|False| |探测的时间间隔。默认值 10秒，范围:[1-300]|
|**timeoutSeconds**|Integer|False| |探测的超时时间。默认值 1秒；范围:[1-300]|
|**failureThreshold**|Integer|False| |在成功状态后，连续探活失败的次数，认为探活失败。默认值 3次；范围:[1-10]|
|**successThreshold**|Integer|False| |在失败状态后，连续探活成功的次数，认为探活成功。默认值 1次；范围:[1-10]|
|**exec**|ExecSpec|False| |在容器内执行指定命令；如果命令退出时返回码为 0 则认为诊断成功。|
|**httpGet**|HgSpec|False| |对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。<br><br>如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。 <br>|
|**tcpSocket**|TcpSocketSpec|False| |对指定端口上的容器的 IP 地址进行 TCP 检查；如果端口打开，则诊断被认为是成功的。|
### TcpSocketSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**port**|Integer|True| |端口号，范围：[1-65535]|
### HgSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**scheme**|String|False| |默认值：http；可选值 http, https, HTTP, HTTPS。|
|**host**|String|False| |连接到pod的host信息，默认使用pod_ip，满足hostname或者ipv4格式. 长度范围:[0-253]|
|**port**|Integer|True| |端口号。范围：[1-65535]|
|**path**|String|True| |HTTP的路径。范围：[1-256]|
|**httpHeader**|HhSpec[]|False| |自定义Http headers|
### HhSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |http header 键，需满足http的规则。长度范围:[1-64]|
|**value**|String|True| |http header 值|
### ExecSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**command**|String[]|True| |执行的命令，总长度256个字符。|
### EnvSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |环境变量名称（ASCII）。范围：[1-64]。必须为字母、数字、下划线(_)，正则为`[a-zA-Z0-9]*$`。|
|**value**|String|False| |环境变量取值。范围：[0-1024]|
### VolumeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |volume名字，符合DNS-1123 label规范，在一个Pod内唯一。|
|**jdcloudDisk**|JDCloudVolumeSourceSpec|True| |提供给Pod的cloud disk.|
### JDCloudVolumeSourceSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**volumeId**|String|False| |云盘id，使用已有云盘|
|**name**|String|False| |云盘名称|
|**snapshotId**|String|False| |云盘快照id，根据云盘快照创建云盘。|
|**diskType**|String|False| |云盘类型：hdd.std1,ssd.gp1,ssd.io1|
|**sizeGB**|Integer|False| |云盘size,单位 GB|
|**fsType**|String|True| |指定volume文件系统类型，目前支持[xfs, ext4]；如果新创建的盘，不指定文件系统类型默认格式化成xfs。|
|**formatVolume**|Boolean|False| |随容器自动创建的新盘，会自动格式化成指定的文件系统类型；挂载已有的盘，默认不会格式化，只会按照指定的fsType去挂载；如果希望格式化，必须设置此字段为true。|
|**iops**|Integer|False| |云盘的 iops 值，目前只有 ssd.io1 类型有效。|
|**autoDelete**|Boolean|False| |是否随pod删除。默认：true|
### HostAliasSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**hostnames**|String[]|True| |域名列表。<br><br>eg  ["foo.local", "bar.local"]。长度范围 1-10; 元素符合hostname命名规范。<br>|
|**ip**|String|True| |ipv4地址；eg "127.0.0.1"|
### LogConfigSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**logDriver**|String|False| |日志Driver名称，目前只支持默认为每一个容器在本地分配10MB的存储空间，自动rotate。目前仅支持default。默认值：default。|
### DnsConfigSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**nameservers**|String[]|False| |DNS服务器IP地址列表，重复的将会被移除。<br><br>eg ["8.8.8.8", "4.2.2.2"]。列表长度：[0-20]，列表中元素符合IPv4格式。<br>|
|**searches**|String[]|False| |DNS搜索域列表，用于主机名查找。<br><br>eg ["ns1.svc.cluster.local", "my.dns.search.suffix"]。列表长度：[0-6]，列表中所有字符总长度不超过256个。<br>|
|**options**|PodDnsConfigOptionSpec[]|False| |DNS解析器选项列表。<br><br>eg ["ndots":"2", "edns0":""]。列表长度：[0-10]|
### PodDnsConfigOptionSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |长度范围：[1-63]，需满足linux resolver限制|
|**value**|String|False| |长度范围：[0-100]，仅限timeout, attempts, ndots|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**podIds**|String[]| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**429**|Quota exceeded|
|**500**|Internal server error|
|**503**|Service unavailable|
