# imageTasks


## 描述
查询镜像导入任务详情


## 请求方式
GET

## 请求地址
https://vm.jdcloud-api.com/v1/regions/{regionId}/imageTasks

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**taskAction**|String|True| |任务种类。可选值：ImportImage|
|**taskIds**|Integer[]|False| |任务id|
|**taskStatus**|String|False| |任务状态。可选值：pending,running,failed,finished|
|**startTime**|String|False| |任务开始时间|
|**endTime**|String|False| |任务结束时间|
|**pageNumber**|Integer|False|1|页码；默认为1|
|**pageSize**|Integer|False|20|分页大小；默认为20；取值范围[10, 100]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**taskSet**|TaskInfo[]|任务详情|
|**totalCount**|Integer|总数量|
### TaskInfo
|名称|类型|描述|
|---|---|---|
|**taskId**|Integer|任务id|
|**action**|String|任务操作类型|
|**taskStatus**|String|任务状态，pending,running,failed,finished|
|**progress**|Integer|任务进度，0-100|
|**message**|String|额外信息|
|**createdTime**|String|任务创建时间|
|**finishedTime**|String|任务完成时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
