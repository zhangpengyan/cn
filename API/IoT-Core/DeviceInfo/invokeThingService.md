# invokeThingService


## 描述
设备服务调用

## 请求方式
POST

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/devices/{identifier}/services

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceId**|String|True| |设备归属的实例ID|
|**regionId**|String|True| |设备归属的实例所在区域|
|**identifier**|String|True| |设备唯一标识|
|**productKey**|String|True| |产品Key|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |服务名称|
|**input**|Object|False| |输入参数,object的key为参数名称，value为参数值|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**msgId**|String|消息唯一标识|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
