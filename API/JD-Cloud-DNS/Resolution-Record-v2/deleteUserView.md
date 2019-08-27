# deleteUserView


## 描述
删除主域名的自定义解析线路

## 请求方式
POST

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/DeleteUserView

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|DelView|True| |删除自定义线路的参数|

### DelView
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainName**|String|True| |主域名|
|**viewName**|String|True| |自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**viewId**|Integer|True| |自定义线路ID|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
