# createUserView


## 描述
添加主域名的自定义解析线路

## 请求方式
POST

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/UserView

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|AddView|True| |添加自定义线路的参数|

### AddView
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainName**|String|True| |主域名|
|**viewName**|String|True| |自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**ipRanges**|String[]|True| |用户输入的此线路的ip段。  <br>IPv4地址段支持1.2.3.4-5.6.7.8和1.2.3.4/16两种格式。    <br>IPv6地址段支持CIDR格式，例如：11:22:33:44:55::99/64<br>|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**data**|Userview|添加成功后返回的自定义线路的结构|
### Userview
|名称|类型|描述|
|---|---|---|
|**viewId**|Integer|自定义线路ID|
|**viewName**|String|自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**domainId**|Integer|主域名ID|
|**domainName**|String|域名|
|**isDelete**|Integer|是否删除，0:没有删除，1:已删除|
|**creator**|String|创建者|
|**createTime**|Integer|创建时间，格式Unix timestamp，时间单位：秒|
|**updator**|String|更新者|
|**updateTime**|Integer|更新时间，格式Unix timestamp，时间单位：秒|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
