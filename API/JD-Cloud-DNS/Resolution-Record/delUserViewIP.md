# delUserViewIP


## 描述
删除域名的自定义解析线路的IP段

## 请求方式
POST

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/userview/delUserViewIP

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|DelViewIP|True| |删除域名的自定义解析线路的IP段的参数|

### DelViewIP
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Integer|True| |域名ID|
|**ipRanges**|String[]|True| |此线路需要删除的ip段。<br><br>ip段支持1.2.3.4-5.6.7.8和1.2.3.4/16两种格式。    <br>|
|**viewId**|Integer|True| |自定义线路ID|
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
