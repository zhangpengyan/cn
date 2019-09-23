# updateLogset


## 描述
更新日志集。日志集名称不可更新。

## 请求方式
PUT

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logsets/{logsetUID}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logsetUID**|String|True| |日志集 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-pin**|String|True| |用户（主、子）账号。base64编码。格式为：base64(subuser-pin) @ base64(owner-pin)。@前后有空格。若不支持主子账号，则不需要@，格式为 base64(owner-pin)|
|**x-jdcloud-erp**|String|False| |x-jdcloud-erp   base64(username)|
|**x-jdcloud-request-id**|String|True| |请求ID|
|**description**|String|False| |日志集描述|
|**lifeCycle**|Long|False| |保存周期，只能是 7， 15， 30|


## 返回参数
无


## 返回码
|返回码|描述|
|---|---|
|**200**||
|**400**||
|**500**||
