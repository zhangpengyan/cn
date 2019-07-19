# getExternalLink


## 描述
生成带有效期的包地址

## 请求方式
GET

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{jobid}/builds/{id}/externalLink

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**jobid**|String|True| |job uuid|
|**id**|String|True| |构建任务uuid|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**expires**|Integer|False| |过期时间，单位秒， 默认1800秒|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**url**|String| |
|**token**|String| |
|**urlValid**|Int| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
