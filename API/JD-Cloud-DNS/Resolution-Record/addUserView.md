# addUserView


## 描述
添加域名的自定义解析线路

## 请求方式
POST

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/userview/addUserView

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|AddView|True| |添加自定义线路的参数|

### AddView
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Integer|True| |域名ID|
|**domainName**|String|True| |主域名|
|**ipRanges**|String[]|True| |用户输入的此线路的ip段。<br><br>ip段支持1.2.3.4-5.6.7.8和1.2.3.4/16两种格式。<br>|
|**viewName**|String|True| |自定义线路名称, 最多64个字符|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**data**|Userview|添加成功后返回的自定义线路的结构|
### Userview
|名称|类型|描述|
|---|---|---|
|**createTime**|Integer|创建时间，格式Unix timestamp，时间单位：秒|
|**creator**|String|创建者|
|**domainId**|Integer|域名ID|
|**domainName**|String|域名|
|**isDelete**|Integer|是否删除，0:没有删除，1:已删除|
|**updateTime**|Integer|更新时间，格式Unix timestamp，时间单位：秒|
|**updator**|String|更新者|
|**viewId**|Integer|自定义线路ID|
|**viewName**|String|自定义线路名称, 最多64个字符|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
