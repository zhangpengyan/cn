# describeServerConfig


## 描述
查询(k8s 集群)服务配置信息

## 请求方式
GET

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/serverConfig

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

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
|**serverConfig**|ServerConfig| |
### ServerConfig
|名称|类型|描述|
|---|---|---|
|**validMasterVersions**|String[]|kubernetes master 的支持版本|
|**defaultMasterVersion**|String|kubernetes master 的默认版本|
|**validNodeConfig**|ValidNodeConfig[]|node 节点的配置|
### ValidNodeConfig
|名称|类型|描述|
|---|---|---|
|**nodeVersion**|String|kubernetes node 的版本|
|**imageId**|String[]|镜像id|

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
