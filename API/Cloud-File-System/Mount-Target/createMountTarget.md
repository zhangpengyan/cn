# createMountTarget


## 描述
- 为一个文件系统创建一个挂载目标。通过这个挂载目标,你可以挂载将一个文件系统挂载到主机实例上。
- 创建一个挂载目标，为这个挂载目标分配一个Id


## 请求方式
POST

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/mountTargets

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**fileSystemId**|String|True| |创建挂载目标的文件系统|
|**subnetId**|String|True| |子网id|
|**vpcId**|String|True| |vpcId|
|**securityGroupId**|String|True| |安全组id|
|**clientToken**|String|True| |幂等性参数(只支持数字、大小写字母，且不能超过64字符)|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|结果集|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**mountTargetId**|String|挂载目标 ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
