# describeSnapshots


## 描述
查询云硬盘快照列表，filters多个过滤条件之间是逻辑与(AND)，每个条件内部的多个取值是逻辑或(OR)

## 请求方式
GET

## 请求地址
https://disk.jdcloud-api.com/v1/regions/{regionId}/snapshots

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码, 默认为1, 取值范围：[1,∞)|
|**pageSize**|Integer|False|20|分页大小，默认为20，取值范围：[10,100]|
|**snapshotSource**|String|False| |查找快照的类型，可以为private，others，shared，默认为private|
|**filters**|Filter[]|False| |snapshotId - 云硬盘快照ID，支持多个<br>diskId - 生成快照的云硬盘ID，支持多个<br>status - 快照状态，精确匹配，支持多个,取值为 creating、available、copying、deleting、error_create、error_delete<br>name - 快照名称，模糊匹配，支持单个<br>|

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
|**snapshots**|Snapshot[]|查询的快照信息详情列表|
|**totalCount**|Integer|查询的快照数目|
### Snapshot
|名称|类型|描述|
|---|---|---|
|**snapshotId**|String|云硬盘快照ID|
|**snapshotSource**|String|快照来源 可以有self，others两种来源|
|**diskId**|String|创建快照的云硬盘ID(snapshotSource为others时不展示)|
|**snapshotSizeGB**|Integer|快照大小，单位为GiB|
|**images**|String[]|快照关联的所有镜像ID(snapshotSource为others时不展示)|
|**name**|String|快照名称|
|**description**|String|快照描述|
|**status**|String|快照状态，取值为 creating、available、in-use、deleting、error_create、error_delete 之一|
|**createTime**|String|创建时间|
|**sharInfo**|ShareInfo[]|共享信息|
|**encrypted**|Boolean|快照是否为加密盘的快照|
### ShareInfo
|名称|类型|描述|
|---|---|---|
|**shareTo**|String|被共享快照的用户的pin|
|**shareTime**|String|共享时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**500**|Internal server error|
|**503**|Service unavailable|
