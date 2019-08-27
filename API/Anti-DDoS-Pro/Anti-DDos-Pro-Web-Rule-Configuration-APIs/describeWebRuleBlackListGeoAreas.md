# describeWebRuleBlackListGeoAreas


## 描述
查询网站类转发规则 Geo 模式的黑名单可设置区域编码

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/describeWebRuleBlackListGeoAreas

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|

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
