# describeNodeGroup


## 描述
查询单个节点组详情

## 请求方式
GET

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/nodeGroups/{nodeGroupId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**nodeGroupId**|String|True| |节点组 ID|

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
|**nodeGroup**|NodeGroup| |
### NodeGroup
|名称|类型|描述|
|---|---|---|
|**clusterId**|String|集群id|
|**nodeGroupId**|String|node group id|
|**name**|String|名称|
|**description**|String|描述|
|**nodeConfig**|NodeConfig|Node的信息|
|**version**|String|k8s中的node的版本|
|**nodeNetwork**|NodeNetwork|node所属的网络信息|
|**currentCount**|Integer|当前node数量|
|**expectCount**|Integer|期望的node数量|
|**agId**|String|node group的ag id ，通过agid可以查询该node group下的实例|
|**instanceTemplateId**|String|node group的ag id对应的实例模板|
|**state**|String|状态  [pending,running,resizing,reconciling,deleting,deleted,error,running_with_error(部分节点有问题)]|
|**updateTime**|String|更新时间|
|**stateMessage**|String|状态变更原因|
|**autoRepair**|String|是否开启自动修复|
|**createdTime**|String|创建时间|
### NodeNetwork
|名称|类型|描述|
|---|---|---|
|**podSubnetId**|String|pod子网的id|
|**nodeSubnetId**|String|node子网的id|
|**serviceSubnetId**|String|service子网的id|
|**servicePublicSubnetId**|String|service关联LB的具有公网访问能力的子网id|
|**nodeNetworkCidr**|String|node的cidr|
|**vpcId**|String|vpc id|
### NodeConfig
|名称|类型|描述|
|---|---|---|
|**instanceType**|String|实例类型|
|**imageId**|String|镜像信息|
|**systemDiskSize**|Integer|云盘系统盘的大小  单位(GB)|
|**systemDiskType**|String|云盘系统盘的大小[ssd,premium-hdd]|
|**labels**|LabelSpec[]|Node的信息|
### LabelSpec
|名称|类型|描述|
|---|---|---|
|**key**|String|key包含两个部分：prefix与name，name是必须的，prefix是可选的。prefix与name分隔用"/"。 <br>name 可以是字母，数字，[-_.]。长度小于63。prefix：遵循DNS标准（例如：kubernetes.io/），长度不超过253 <br>[参照](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#syntax-and-character-set)    <br>|
|**value**|String|字母，数字,[-_.],长度不超过63|

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
