# getBackSourceConfiguration


## 描述
获取回源配置

## 请求方式
GET

## 请求地址
https://ossopenapi.jdcloud-api.com/v1/regions/{regionId}/buckets/{bucketName}/backSource

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bucketName**|String|True| |Bucket名称|
|**regionId**|String|True| |区域ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**bucketBackSourceConfiguration**|BucketBackSourceConfiguration| |
### BucketBackSourceConfiguration
|名称|类型|描述|
|---|---|---|
|**backSourceRules**|BackSourceRule[]|回源配置规则|
### BackSourceRule
|名称|类型|描述|
|---|---|---|
|**address**|BackSourceAddress| |
|**allowQueryString**|Boolean|是否允许query String|
|**backSourceType**|String|回源类型|
|**condition**|BackSourceRuleCondition| |
|**followRedirects**|Boolean|是否跟随重定向|
|**headerRule**|BackSourceHeaderRule| |
### BackSourceAddress
|名称|类型|描述|
|---|---|---|
|**hostName**|String|域名|
|**protocol**|String|地址协议, 如http|
|**replaceKeyPrefixWith**|String|将前缀替换为指定的内容|
|**replaceKeySuffixWith**|String|将后缀替换为指定的内容|
|**replaceKeyWith**|String|将key替换为指定内容|
### BackSourceRuleCondition
|名称|类型|描述|
|---|---|---|
|**httpErrorCodeReturnedEquals**|Integer|当http错误码为指定错误码时开启回源|
|**keyPrefixEquals**|String|当前缀为指定的前缀时开启回源|
### BackSourceHeaderRule
|名称|类型|描述|
|---|---|---|
|**allowAllHeaders**|Boolean|是否允许所有的Http header|
|**allowHeaders**|String[]|允许的http header列表|
|**notAllowHeaders**|String[]|禁止的http header列表|
|**setHeaders**|Object|设置指定http header参数，类型为Map\<String, String>|

## 返回码
|返回码|描述|
|---|---|
|**200**|success|
