# createProduct


## 描述
新建产品

## 请求方式
POST

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**instanceId**|String|True| |IoT Engine实例ID信息|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**productName**|String|True| |产品名称，名称不可为空，3-30个字符，只支持汉字、英文字母、数字、下划线“_”及中划线“-”，必须以汉字、英文字母及数字开头结尾|
|**productType**|Integer|True| |节点类型，取值：<br>0：设备。设备不能挂载子设备。可以直连物联网平台，也可以作为网关的子设备连接物联网平台<br>1：网关。网关可以挂载子设备，具有子设备管理模块，维持子设备的拓扑关系，和将拓扑关系同步到物联网平台<br>|
|**productDescription**|String|False| |产品描述，80字符以内|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**productKey**|String| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
