# describeMountTargets


## 描述
-   查询挂载目标列表。


## 请求方式
GET

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/mountTargets

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码, 默认为1, 取值范围：[1,∞)|
|**pageSize**|Integer|False|20|分页大小，默认为20，取值范围：[10,100]|
|**filters**|Filter[]|False| |fileSystemId - 文件系统ID，精确匹配，支持多个<br>mountTargetId - 挂载目标ID，精确匹配，支持多个<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询结果集|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**mountTargets**|MountTarget[]|挂载目标信息列表|
|**totalCount**|Integer|查询的挂载目标数目|
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
|**500**|Internal server error|
|**503**|Service unavailable|
