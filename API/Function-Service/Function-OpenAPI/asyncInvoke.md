# asyncInvoke


## 描述
异步测试执行函数

## 请求方式
POST

## 请求地址
https://function.jdcloud-api.com/v1/regions/{regionId}/functions/{functionName}/versions/{versionName}:asyncinvoke

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**functionName**|String|True| |函数名称|
|**versionName**|String|True| |版本名称|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**event**|String|True| |异步执行函数的输入事件|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|本次请求Id|


## 返回码
|返回码|描述|
|---|---|
|**200**|A successful response.|
|**404**|NOT_FOUND|
