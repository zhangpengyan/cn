# createCluster


## 描述
- 创建集群
- 证书
  - 关于kubernetes的证书，默认生成，不需要用户传入。
- nodegroup
  - cluster必须与nodeGroup进行绑定
  - cluster支持多nodegroup
  - 状态
    - pending,reconciling,deleting状态不可以操作更新接口
    - running，running_with_error状态可以操作nodegroup所有接口
    - error状态只可以查询，删除
    - delete状态的cluster在十五分钟内可以查询，十五分钟后无法查询到
- 状态限制
  - pending,reconciling,deleting状态不可以操作更新接口
  - running状态可以操作cluster所有接口
  - error状态只可以查询，删除
  - delete状态的cluster在十五分钟内可以查询，十五分钟后无法查询到


## 请求方式
POST

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/clusters

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |名称（同一用户的 cluster 允许重名）|
|**description**|String|False| |描述|
|**basicAuth**|Boolean|False| |默认开启 basicAuth与clientCertificate最少选择一个|
|**clientCertificate**|Boolean|False| |默认开启 clientCertificate|
|**version**|String|False| |kubernetes的版本|
|**azs**|String[]|True| |集群所在的az|
|**nodeGroup**|NodeGroupSpec|True| |pod 创建参数|
|**masterCidr**|String|True| |k8s的master的cidr|
|**accessKey**|String|True| |用户的AccessKey，插件调用open-api时的认证凭证|
|**secretKey**|String|True| |用户的SecretKey，插件调用open-api时的认证凭证|
|**userMetrics**|Boolean|False| |是否启用用户自定义监控，默认不启用|

### NodeGroupSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |名称|
|**description**|String|False| | |
|**nodeConfig**|NodeConfigSpec|True| |Node的信息|
|**initialNodeCount**|Integer|True| |nodeGroup初始化大小，至少为1个|
|**vpcId**|String|True| |k8s运行的vpc|
|**nodeCidr**|String|False| |k8s的node的cidr|
|**autoRepair**|Boolean|False| |是否开启自动修复，默认不开启。|
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
|**clusterId**|String| |

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
