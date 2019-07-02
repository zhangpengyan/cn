# describeStackResources


## 描述
查询资源栈中资源列表

## 请求方式
GET

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/stacks/{stackId}/resources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**stackId**|String|True| |资源栈 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**search**|String|False| |按照京东云产品线名称或者资源逻辑ID进行模糊搜索|
|**product**|String|False| |只按照京东云产品线名称进行模糊搜索，比如VM，Disk等|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**list**|ResourceOut[]| |
|**totalCount**|Long| |
### ResourceOut
|名称|类型|描述|
|---|---|---|
|**action**|String|资源运行操作|
|**createTime**|String|创建时间|
|**deletePolicy**|String|删除策略|
|**deleteTime**|String|删除时间|
|**logicId**|String|资源逻辑ID|
|**physicalId**|String|资源ID|
|**region**|String|地域信息|
|**snapshot**|String|Snapshot信息，仅针对磁盘资源类型|
|**stackId**|String|资源栈ID|
|**status**|String|资源运行状态|
|**statusReason**|String|资源运行状态原因|
|**type**|String|资源类型|
|**updateTime**|String|更新时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询资源栈中资源列表|
