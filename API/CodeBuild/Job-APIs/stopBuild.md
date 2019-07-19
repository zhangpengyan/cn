# stopBuild


## 描述
停止构建任务

## 请求方式
POST

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{jobid}/builds/{id}:stop

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
|**id**|String| |
|**result**|Boolean| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
