# describeGeoAreas


## 描述
查询非网站类转发规则的防护规则 Geo 拦截可设置区域编码

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/describeGeoAreas

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**code**|Integer|请求错误状态码|
|**status**|String|请求错误状态码|
|**message**|String|请求错误提示|
### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|Country[]| |
### Country
|名称|类型|描述|
|---|---|---|
|**label**|String|国家或地区名称|
|**value**|String|国家或地区编码|
|**children**|Country[]| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
