# removeDevice


## 描述
删除设备

## 请求方式
DELETE

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/device/{deviceName}:delete

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**deviceName**|String|True| |设备名称|
|**instanceId**|String|True| |设备归属的实例ID|
|**regionId**|String|True| |设备归属的实例所在区域|
|**productKey**|String|True| |产品Key|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
