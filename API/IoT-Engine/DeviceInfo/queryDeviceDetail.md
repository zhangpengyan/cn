# queryDeviceDetail


## 描述
查询设备详情

## 请求方式
GET

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/device/{deviceName}:detail

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
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**deviceId**|String|设备ID|
|**deviceName**|String|设备名称|
|**parentId**|String|父级设备Id|
|**deviceType**|String|设备类型，同产品类型，0-普通设备，1-网关，2-Edge|
|**status**|Integer|设备状态，0-未激活，1-激活离线，2-激活在线|
|**productKey**|String|产品Key|
|**identifier**|String|设备标识符|
|**secret**|String|设备秘钥|
|**description**|String|设备描述|
|**activatedTime**|Long|激活时间|
|**lastConnectedTime**|Long|最后连接时间|
|**createdTime**|Long|注册时间|
|**updatedTime**|Long|修改时间|
|**productName**|String|产品名称|
|**model**|String|设备型号|
|**manufacturer**|String|设备厂商|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
