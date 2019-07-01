# startChannel


## 描述
启动数据同步

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/migration_mysqlChannels/{id}:start

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |channel ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-userid**|String|True| |用户ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|NO CONTENT|
