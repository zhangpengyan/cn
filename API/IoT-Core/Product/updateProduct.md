# updateProduct


## 描述
修改产品

## 请求方式
PATCH

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**instanceId**|String|True| |IoT Engine实例ID信息|
|**productKey**|String|True| |产品Key|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**productName**|String|False| |产品名称，名称不可为空，3-30个字符，只支持汉字、英文字母、数字、下划线“_”及中划线“-”，必须以汉字、英文字母及数字开头结尾|
|**productDescription**|String|False| |产品描述，80字符以内|
|**dynamicRegister**|Integer|False| |动态注册,0:关闭，1:开启|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
