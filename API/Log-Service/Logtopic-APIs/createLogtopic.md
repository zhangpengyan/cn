# createLogtopic


## 描述
创建日志主题，不可与当前日志集下现有日志主题重名。

## 请求方式
POST

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logsets/{logsetUID}/logtopics

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logsetUID**|String|True| |日志集 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |日志主题名称|
|**description**|String|False| |日志集描述|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**uID**|String|UID|

## 返回码
|返回码|描述|
|---|---|
|**200**|创建日志主题结果|
