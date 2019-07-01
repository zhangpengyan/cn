# putBackSourceConfiguration


## 描述
添加修改回源配置

## 请求方式
PUT

## 请求地址
https://ossopenapi.jdcloud-api.com/v1/regions/{regionId}/buckets/{bucketName}/backSource

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bucketName**|String|True| |Bucket名称|
|**regionId**|String|True| |区域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**backSourceRules**|BackSourceRule[]|False| |回源配置规则|

### BackSourceRule
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**address**|BackSourceAddress|False| | |
|**allowQueryString**|Boolean|False| |是否允许query String|
|**backSourceType**|String|False| |回源类型|
|**condition**|BackSourceRuleCondition|False| | |
|**followRedirects**|Boolean|False| |是否跟随重定向|
|**headerRule**|BackSourceHeaderRule|False| | |
### BackSourceAddress
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**hostName**|String|False| |域名|
|**protocol**|String|False| |地址协议, 如http|
|**replaceKeyPrefixWith**|String|False| |将前缀替换为指定的内容|
|**replaceKeySuffixWith**|String|False| |将后缀替换为指定的内容|
|**replaceKeyWith**|String|False| |将key替换为指定内容|
### BackSourceRuleCondition
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**httpErrorCodeReturnedEquals**|Integer|False| |当http错误码为指定错误码时开启回源|
|**keyPrefixEquals**|String|False| |当前缀为指定的前缀时开启回源|
### BackSourceHeaderRule
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**allowAllHeaders**|Boolean|False| |是否允许所有的Http header|
|**allowHeaders**|String[]|False| |允许的http header列表|
|**notAllowHeaders**|String[]|False| |禁止的http header列表|
|**setHeaders**|Object|False| |设置指定http header参数，类型为Map\<String, String>|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|success|
