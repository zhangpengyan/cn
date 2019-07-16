# describeVersions


## 描述
查询版本信息

## 请求方式
GET

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/versions

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**masterVersion**|String|False| |集群的大版本，如 1.12.4-jcs.1|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**masterVersions**|MasterVersion[]| |
### MasterVersion
|名称|类型|描述|
|---|---|---|
|**version**|String|集群版本号|
|**isDefault**|Boolean|是否默认版本|
|**defaultNodeVersion**|String|默认ndoe版本号|
|**versionStatus**|String|版本状态|
|**nodeVersions**|NodeVersion[]|node 节点的配置|
### NodeVersion
|名称|类型|描述|
|---|---|---|
|**version**|String|节点版本号|
|**imageOs**|String|镜像操作系统|
|**versionStatus**|String|版本状态|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
