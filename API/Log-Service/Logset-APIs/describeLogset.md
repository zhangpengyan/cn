# describeLogset


## 描述
查询日志集详情。

## 请求方式
GET

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logsets/{logsetUID}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logsetUID**|String|True| |日志集 UID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**uID**|String|UID|
|**createTime**|String|创建时间|
|**description**|String|描述信息|
|**hasTopic**|Boolean|是否存在日志主题|
|**lifeCycle**|Long|保存周期|
|**name**|String|日志集名称|
|**region**|String|地域信息|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询日志集结果|
