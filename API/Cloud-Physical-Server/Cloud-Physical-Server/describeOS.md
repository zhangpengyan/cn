# describeOS


## 描述
查询云物理服务器支持的操作系统

## 请求方式
GET

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/os

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**deviceType**|String|True| |实例类型，可调用接口（describeDeviceTypes）获取指定地域的实例类型，例如：cps.c.normal|
|**osType**|String|False| |操作系统类型，取值范围：CentOS、Ubuntu|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**oss**|Os[]| |
### Os
|名称|类型|描述|
|---|---|---|
|**osTypeId**|String|操作系统系统类型ID|
|**osName**|String|操作系统系统名称, 如 Ubuntu 16.04(x86_64)|
|**osType**|String|操作系统类型, 如 ubuntu/centos|
|**osVersion**|String|操作系统版本, 如 14.04/16.04|
|**deviceType**|String|实例类型, 如 cps.c.normal|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
