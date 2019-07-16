# validCloudInfo


## 描述
验证指定云信息的AK、SK

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/cloud_info/{cloudId}/valid

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cloudId**|String|True| |云信息ID|
|**regionId**|String|True| |地域ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**401**|NOT PASS|
