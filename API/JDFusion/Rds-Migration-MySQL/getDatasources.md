# getDatasources


## 描述
查询数据源

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/migration_mysqlDatasources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-userid**|String|True| |用户ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**datasources**|DatasourceInfo[]| |
### DatasourceInfo
|名称|类型|描述|
|---|---|---|
|**id**|String|ID|
|**address**|String|服务器地址|
|**port**|Integer|端口|
|**username**|String|数据库账号|
|**password**|String|数据库密码|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
