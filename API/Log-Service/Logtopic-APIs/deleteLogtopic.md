# deleteLogtopic


## 描述
删除日志主题。其采集配置与采集实例配置将一并删除。

## 请求方式
DELETE

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logsets/{logsetUID}/logtopics/{logtopicUIDs}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logsetUID**|String|True| |日志集 UID|
|**logtopicUIDs**|String|True| |日志主题ID，多个日志主题ID以逗号分割|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求的标识id|


## 返回码
|返回码|描述|
|---|---|
|**200**|删除日志主题结果|
