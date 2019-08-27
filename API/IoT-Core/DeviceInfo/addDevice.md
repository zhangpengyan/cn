# addDevice


## 描述
注册单个设备并返回秘钥信息

## 请求方式
POST

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/device:add

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceId**|String|True| |设备归属的实例ID|
|**regionId**|String|True| |设备归属的实例所在区域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**deviceName**|String|False| |设备名称|
|**productKey**|String|False| |设备所归属的产品|
|**model**|String|False| |设备型号|
|**manufacturer**|String|False| |厂商|
|**description**|String|False| |设备描述|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**deviceName**|String|设备名称|
|**identifier**|String|设备标识符|
|**secret**|String|设备秘钥|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
