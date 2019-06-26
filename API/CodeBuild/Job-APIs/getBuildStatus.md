# getBuildStatus


## 描述
查询构建任务执行的状态

## 请求方式
GET

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{jobid}/builds/{id}/status

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**jobid**|String|True| |job uuid|
|**id**|String|True| |构建任务uuid|
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
|**name**|String|执行任务的job名称|
|**createdAt**|Integer|开始执行构建的时间|
|**status**|String|执行构建的状态|
|**completionRate**|Float|执行构建完成的百分比|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
