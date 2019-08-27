# describeProduct


## 描述
查看产品

## 请求方式
GET

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**instanceId**|String|True| |IoT Engine实例ID信息|
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
|**productName**|String|产品名称|
|**productType**|Integer|节点类型，取值：<br>0：设备。设备不能挂载子设备。可以直连物联网平台，也可以作为网关的子设备连接物联网平台<br>1：网关。网关可以挂载子设备，具有子设备管理模块，维持子设备的拓扑关系，和将拓扑关系同步到物联网平台<br>|
|**productKey**|String|产品key|
|**productSecret**|String|产品秘钥|
|**createdTime**|Long|创建时间,时间为东八区（UTC/GMT+08:00）|
|**deviceCount**|Integer|包含设备数|
|**dynamicRegister**|Integer|动态注册,0:关闭，1:开启|
|**productDescription**|String|产品描述信息|
|**templateName**|String|产品类型,如自定义等|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
