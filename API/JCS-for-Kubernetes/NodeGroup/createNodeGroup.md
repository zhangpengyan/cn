# createNodeGroup


## 描述
创建k8s的nodeGroup
要求集群状态为running


## 请求方式
POST

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/nodeGroups

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |名称（同一用户的 cluster 内部唯一）|
|**description**|String|False| |描述|
|**clusterId**|String|True| |node group所属的cluster|
|**nodeConfig**|NodeConfigSpec|True| |节点组配置|
|**initialNodeCount**|Integer|True| |nodeGroup初始化大小|
|**vpcId**|String|True| |k8s运行的vpc|
|**nodeCidr**|String|True| |k8s的node的cidr|
|**autoRepair**|Boolean|False| |是否开启 node group 的自动修复，默认关闭|

### NodeConfigSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceType**|String|True| |实例类型|
|**version**|String|False| |镜像信息|
|**systemDiskSize**|Integer|True| |云盘系统盘的大小  单位(GB)|
|**systemDiskType**|String|True| |云盘系统盘的大小[ssd,premium-hdd]|
|**labels**|LabelSpec[]|False| |Node的信息|
### LabelSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|True| |key包含两个部分：prefix与name，name是必须的，prefix是可选的。prefix与name分隔用"/"。 <br>name 可以是字母，数字，[-_.]。长度小于63。prefix：遵循DNS标准（例如：kubernetes.io/），长度不超过253 <br>[参照](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#syntax-and-character-set)    <br>|
|**value**|String|False| |字母，数字,[-_.],长度不超过63|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**nodeGroupId**|String| |

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
