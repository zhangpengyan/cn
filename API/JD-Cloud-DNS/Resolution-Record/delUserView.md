# delUserView


## 描述
删除域名的自定义解析线路

## 请求方式
POST

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/userview/delUserView

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|DelView|True| |删除自定义线路的参数|

### DelView
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Integer|True| |域名ID|
|**domainName**|String|True| |主域名|
|**viewId**|String|True| |自定义线路ID|
|**viewName**|String|True| |自定义线路名称, 最多64个字符|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
