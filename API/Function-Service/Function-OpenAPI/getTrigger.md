# getTrigger


## 描述
获取触发器详情

## 请求方式
GET

## 请求地址
https://function.jdcloud-api.com/v1/regions/{regionId}/functions/{functionName}/versions/{versionName}:gettrigger

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**functionName**|String|True| |函数名称|
|**versionName**|String|True| |版本名称|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**triggerId**|String|True| |触发器Id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|获取触发器详情返回值|
|**requestId**|String|本次请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|Trigger| |
### Trigger
|名称|类型|描述|
|---|---|---|
|**triggerId**|String|触发器Id|
|**functionName**|String|触发器所属的函数名称|
|**versionName**|String|触发器所属的函数版本名称|
|**eventSource**|String|触发器对应的事件源类型，目前有oss和apigateway|
|**eventSourceId**|String|触发器对应的事件源Id|
|**createTime**|String|触发器创建时间|
|**updateTime**|String|触发器最后修改时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|A successful response.|
|**404**|NOT_FOUND|
