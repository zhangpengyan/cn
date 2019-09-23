# importThingModel


## 描述
导入物模型

## 请求方式
PUT

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/abilities:importThingModel

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**instanceId**|String|True| |IoT Hub实例ID信息|
|**productKey**|String|True| |产品Key|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**thingModel**|Object|True| |物模型JSON|


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
