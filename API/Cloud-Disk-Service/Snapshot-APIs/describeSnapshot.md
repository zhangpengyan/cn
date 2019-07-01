# describeSnapshot


## 描述
查询云硬盘快照信息详情

## 请求方式
GET

## 请求地址
https://disk.jdcloud-api.com/v1/regions/{regionId}/snapshots/{snapshotId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**snapshotId**|String|True| |快照ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询的快照信息详情|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**snapshot**|Snapshot| |
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
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
