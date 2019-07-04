# getBuildLog


## 描述
查询构建任务执行日志

## 请求方式
GET

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{jobid}/builds/{id}/log

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**jobid**|String|True| |job uuid|
|**id**|String|True| |构建任务uuid|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**offsetNumber**|Integer|False| |查询日志的偏移量, 默认为0|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**log**|String| |
|**offsetNumber**|Integer| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
