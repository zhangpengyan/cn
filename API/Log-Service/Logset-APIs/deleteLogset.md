# deleteLogset


## 描述
删除日志集,删除多个日志集时，任意的日志集包含了日志主题的，将导致全部删除失败。

## 请求方式
DELETE

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logsets/{logsetUIDs}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logsetUIDs**|String|True| |日志集ID，多个日志集ID以逗号分割|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求的标识id|


## 返回码
|返回码|描述|
|---|---|
|**200**|删除日志集结果|
