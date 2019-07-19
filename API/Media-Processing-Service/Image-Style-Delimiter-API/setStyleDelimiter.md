# setStyleDelimiter


## 描述
设置图片样式分隔符

## 请求方式
PUT

## 请求地址
https://mps.jdcloud-api.com/v1/regions/{regionId}/buckets/{bucketName}/styleDelimiter/

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域ID|
|**bucketName**|String|True| |Bucket名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**delimiters**|String[]|True| |图片样式分隔符配置（JSON数组）；支持的分隔符包含：["-", "_", "/", "!"]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|success|
