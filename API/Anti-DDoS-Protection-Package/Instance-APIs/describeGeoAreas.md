# describeGeoAreas


## 描述
查询防护规则 Geo 拦截可设置区域

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/describeGeoAreas


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
|**err**|Err| |
### Err
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
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
