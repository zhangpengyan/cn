# createContainers


## 描述
创建一台或多台指定配置容器
- 创建容器需要通过实名认证
- 镜像
  - 容器的镜像通过镜像名称来确定
  - nginx:tag, mysql/mysql-server:tag这样命名的镜像表示docker hub官方镜像
  - container-registry/image:tag这样命名的镜像表示私有仓储的镜像
  - 私有仓储必须兼容docker registry认证机制，并通过secret来保存机密信息
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
  - 正则表达式
    - `^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])(\.([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]))*$`
- 网络配置
  - 指定主网卡配置信息
    - 必须指定vpcId、subnetId、securityGroupIds
    - 可以指定elasticIp规格来约束创建的弹性IP，带宽取值范围[1-200]Mbps，步进1Mbps
    - 可以指定网卡的主IP(primaryIpAddress)和辅助IP(secondaryIpAddresses)，此时maxCount只能为1
    - 可以指定希望的辅助IP个数(secondaryIpAddressCount)让系统自动创建内网IP
    - 可以设置网卡的自动删除autoDelete属性，指明是否删除实例时自动删除网卡
    - 安全组securityGroup需与子网Subnet在同一个私有网络VPC内
    - 每个容器至多指定5个安全组
    - 主网卡deviceIndex设置为0
- 存储
  - volume分为root volume和data volume，root volume的挂载目录是/，data volume的挂载目录可以随意指定
  - volume的底层存储介质当前只支持cloud类别，也就是云硬盘
  - 云盘类型为 ssd.io1 时，用户可以指定 iops，其他类型云盘无效，对已经存在的云盘无效，具体规则如下
    - 步长 10
    - 范围 [200，min(32000，size*50)]
    - 默认值 size*30
  - root volume
  - root volume只能是cloud类别
    - 云硬盘类型可以选择hdd.std1、ssd.gp1、ssd.io1
    - 磁盘大小
      - 所有类型：范围[10,100]GB，步长为10G
    - 自动删除
      - 默认自动删除
    - 可以选择已存在的云硬盘
  - data volume
    - data volume当前只能选择cloud类别
    - 云硬盘类型可以选择hdd.std1、ssd.gp1、ssd.io1
    - 磁盘大小
      - 所有类型：范围[20,4000]GB，步长为10G
    - 自动删除
      - 默认自动删除
    - 可以选择已存在的云硬盘
    - 可以从快照创建磁盘
    - 单个容器可以挂载7个data volume
- 容器日志
  - default：默认在本地分配10MB的存储空间，自动rotate
- 其他
  - 创建完成后，容器状态为running
  - maxCount为最大努力，不保证一定能达到maxCount


## 请求方式
POST

## 请求地址
https://nativecontainer.jdcloud-api.com/v1/regions/{regionId}/containers

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**containerSpec**|ContainerSpec|True| |创建容器规格|
|**maxCount**|Integer|True| |购买实例数量；取值范围：[1,100]|
|**clientToken**|String|False| |保证请求幂等性|

### ContainerSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceType**|String|True| |实例类型；参考[文档](https://www.jdcloud.com/help/detail/1992/isCatalog/1)|
|**az**|String|True| |容器所属可用区|
|**name**|String|True| |容器名称|
|**hostAliases**|HostAliasSpec[]|False| |域名和IP映射的信息；</br> 最大10个alias|
|**hostname**|String|False| |主机名，规范请参考说明文档；默认容器ID|
|**command**|String[]|False| |容器执行命令，如果不指定默认是docker镜像的ENTRYPOINT|
|**args**|String[]|False| |容器执行命令的参数，如果不指定默认是docker镜像的CMD|
|**envs**|EnvVar[]|False| |容器执行的环境变量；如果和镜像中的环境变量Key相同，会覆盖镜像中的值；</br> 最大100对|
|**image**|String|True| |镜像名称 </br> 1. Docker Hub官方镜像通过类似nginx, mysql/mysql-server的名字指定 </br> </br> repository长度最大256个字符，tag最大128个字符，registry最大255个字符|
|**secret**|String|False| |镜像仓库认证信息；使用Docker Hub和京东云CR的镜像不需要secret|
|**tty**|Boolean|False| |容器是否分配tty。默认不分配|
|**workingDir**|String|False| |容器的工作目录。如果不指定，默认是根目录（/）；必须是绝对路径|
|**rootVolume**|VolumeMountSpec|True| |根Volume信息|
|**dataVolumes**|VolumeMountSpec[]|False| |挂载的数据Volume信息；最多7个|
|**elasticIp**|ElasticIpSpec|False| |主网卡主IP关联的弹性IP规格|
|**primaryNetworkInterface**|ContainerNetworkInterfaceAttachmentSpec|True| |主网卡配置信息|
|**logConfiguration**|LogConfiguration|False| |容器日志配置信息；默认会在本地分配10MB的存储空间|
|**description**|String|False| |容器描述|
|**charge**|ChargeSpec|False| |计费配置；如不指定，默认计费类型是后付费-按使用时常付费|
### ChargeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**chargeMode**|String|False|postpaid_by_duration|计费模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration.请参阅具体产品线帮助文档确认该产品线支持的计费类型|
|**chargeUnit**|String|False| |预付费计费单位，预付费必填，当chargeMode为prepaid_by_duration时有效，取值为：month、year，默认为month|
|**chargeDuration**|Integer|False| |预付费计费时长，预付费必填，当chargeMode取值为prepaid_by_duration时有效。当chargeUnit为month时取值为：1~9，当chargeUnit为year时取值为：1、2、3|
### LogConfiguration
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**logDriver**|String|False| |日志Driver名称  default：默认在本地分配10MB的存储空间，自动rotate|
### ContainerNetworkInterfaceAttachmentSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**autoDelete**|Boolean|False| |指明删除容器时是否删除网卡，默认True；当前只能是True|
|**deviceIndex**|Integer|False| |设备Index|
|**networkInterface**|NetworkInterfaceSpec|True| |网卡接口规范|
### NetworkInterfaceSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**subnetId**|String|True| |子网ID|
|**az**|String|True| |可用区，用户的默认可用区，暂不支持|
|**primaryIpAddress**|String|False| |网卡主IP|
|**secondaryIpAddresses**|String[]|False| |SecondaryIp列表|
|**secondaryIpCount**|Integer|False| |自动分配的SecondaryIp数量|
|**securityGroups**|String[]|False| |要绑定的安全组ID列表，最多指定5个安全组|
|**sanityCheck**|Boolean|False| |源和目标IP地址校验，取值为0或者1，默认为1，暂不支持此功能|
|**description**|String|False| |描述|
### ElasticIpSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bandwidthMbps**|Integer|True| |弹性公网IP的限速 单位：MB|
|**provider**|String|False| |IP服务商，取值为bgp或no_bgp|
|**chargeSpec**|ChargeSpec|False| |计费配置|
### VolumeMountSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**category**|String|True| |磁盘分类 cloud：基于云硬盘的卷 仅支持cloud类型|
|**autoDelete**|Boolean|False| |自动删除，删除容器时自动删除此volume，默认为True；只支持磁盘是云硬盘的场景|
|**mountPath**|String|False| |容器内的挂载目录；root volume不需要指定，挂载目录是（/）；data volume必须指定；必须是绝对路径，不能包含(:)|
|**readOnly**|Boolean|False| |只读，默认false；只针对data volume有效；root volume为false，也就是可读可写|
|**cloudDiskSpec**|DiskSpec|False| |云硬盘规格；随容器自动创建的云硬盘，不会对磁盘分区，只会格式化文件系统|
|**cloudDiskId**|String|False| |云硬盘ID，使用已有的云硬盘，必须同时指定fsType|
|**fsType**|String|False| |指定volume文件系统类型，目前支持[xfs, ext4]；如果新创建的盘，不指定文件系统类型默认格式化成xfs|
|**formatVolume**|Boolean|False| |随容器自动创建的新盘，会自动格式化成指定的文件系统类型；挂载已有的盘，默认不会格式化，只会按照指定的fsType去挂载；如果希望格式化，必须设置此字段为true|
### DiskSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**az**|String|True| |云硬盘所属的可用区|
|**name**|String|True| |云硬盘名称|
|**description**|String|False| |云硬盘描述|
|**diskType**|String|True| |云硬盘类型，取值为ssd、premium-hdd、ssd.gp1、ssd.io1、hdd.std1之一|
|**diskSizeGB**|Integer|True| |云硬盘大小，单位为 GiB，ssd 类型取值范围[20,1000]GB，步长为10G，premium-hdd 类型取值范围[20,3000]GB，步长为10G, ssd.gp1, ssd.io1, hdd.std1 类型取值均是范围[20,16000]GB，步长为10G|
|**iops**|Integer|False| |云硬盘IOPS的大小，当且仅当云盘类型是ssd.io1型的云盘有效，步长是10.|
|**snapshotId**|String|False| |用于创建云硬盘的快照ID|
|**charge**|ChargeSpec|False| |计费配置；如不指定，默认计费类型是后付费-按使用时常付费|
|**multiAttachable**|Boolean|False| |云硬盘是否支持一盘多主机挂载，默认为false（不支持）|
|**encrypt**|Boolean|False| |云硬盘是否加密，默认为false（不加密）|
### EnvVar
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |环境变量名称|
|**value**|String|False| |环境变量的值|
### HostAliasSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**hostnames**|String[]|True| |域名列表|
|**ip**|String|True| |IP地址|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**containerIds**|String[]| |

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
