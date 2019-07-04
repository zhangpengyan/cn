# describeMountTarget


## 描述
查询挂载目标详情

## 请求方式
GET

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/mountTargets/{mountTargetId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**mountTargetId**|String|True| |挂载目标ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|挂载目标信息|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**mountTarget**|MountTarget| |
### MountTarget
|名称|类型|描述|
|---|---|---|
|**fileSystemId**|String|文件系统ID|
|**ipAddress**|String|ipv4地址|
|**status**|String|挂载目标状态|
|**mountTargetId**|String|挂载目标ID|
|**subnetId**|String|子网ID|
|**vpcId**|String|vpcID|
|**createTime**|String|创建时间|
|**dnsName**|String|dns名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
