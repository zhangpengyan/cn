# listProducts


## 描述
查看产品列表接口

## 请求方式
GET

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**instanceId**|String|True| |IoT Engine实例ID信息|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码, 默认为1, 取值范围：[1,∞)|
|**pageSize**|Integer|False|10|分页大小，默认为10，取值范围：[10,100]|
|**filters**|Filter[]|False| |productName-产品名称，精确匹配，支持单个<br>productKey-产品key，精确匹配，支持单个<br>productType-产品类型，精确匹配，支持单个<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**page**|PageinfoVO|分页信息|
|**products**|Product[]|产品详情|
### Product
|名称|类型|描述|
|---|---|---|
|**productName**|String|产品名称|
|**productId**|String|产品ID|
|**productType**|Integer|0：设备。设备不能挂载子设备。可以直连物联网平台，也可以作为网关的子设备连接物联网平台<br>1：网关。网关可以挂载子设备，具有子设备管理模块，维持子设备的拓扑关系，和将拓扑关系同步到物联网平台<br>|
|**productKey**|String|产品Key|
|**createdTime**|Long|创建时间，创建时间，时间为东八区（UTC/GMT+08:00）|
|**templateName**|String|产品类型，如自定义等|
### PageinfoVO
|名称|类型|描述|
|---|---|---|
|**pageSize**|Integer|每页显示条数|
|**nowPage**|Integer|当前页数|
|**totalSize**|Integer|总记录数|
|**totalPage**|Integer|总页数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
