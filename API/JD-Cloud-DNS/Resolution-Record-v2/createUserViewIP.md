# createUserViewIP


## 描述
添加主域名的自定义解析线路的IP段

## 请求方式
POST

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/UserViewIP

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|AddViewIP|True| |添加域名的自定义解析线路的IP段的参数|

### AddViewIP
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**viewId**|Integer|True| |自定义线路ID|
|**viewName**|String|True| |自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**ipRanges**|String[]|True| |此线路需要添加的ip段。  <br>IPv4地址段支持1.2.3.4-5.6.7.8和1.2.3.4/16两种格式。    <br>IPv6地址段支持CIDR格式，例如：11:22:33:44:55::99/64<br>|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
