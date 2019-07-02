# getStyleDelimiter


## 描述
获取bucket的图片样式分隔符配置

## 请求方式
GET

## 请求地址
https://mps.jdcloud-api.com/v1/regions/{regionId}/buckets/{bucketName}/styleDelimiter/

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域ID|
|**bucketName**|String|True| |Bucket名称|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**styleDelimiterConf**|StyleDelimiterConf| |
### StyleDelimiterConf
|名称|类型|描述|
|---|---|---|
|**delimiters**|String[]|图片样式分隔符配置（JSON数组）；支持的分隔符包含：["-", "_", "/", "!"]|

## 返回码
|返回码|描述|
|---|---|
|**200**|success|
