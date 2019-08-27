# describeThingShadow


## 描述
查看设备影子

## 请求方式
GET

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/devices/{identifier}/shadow

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceId**|String|True| |设备归属的实例ID|
|**regionId**|String|True| |设备归属的实例所在区域|
|**identifier**|String|True| |设备唯一标识|
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
|**state**|Object|设备状态|
|**metadata**|Object|当用户更新设备状态文档后，设备影子服务会自动更新metadata的值。设备状态的元数据的信息包含以 Epoch 时间表示的每个属性的时间戳，用来获取准确的更新时间。|
|**version**|Integer|设备影子版本|
|**timestamp**|Long|设备影子更新时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
