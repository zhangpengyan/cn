# getRdsAccountsByInstIdAndAccountName


## 描述
取得指定RDS实例上的指定账号信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_instances/{instId}/accounts/{accountName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instId**|String|True| |RDS实例ID|
|**accountName**|String|True| |账号名称|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**account**|RdsAccountInfo| |
### RdsAccountInfo
|名称|类型|描述|
|---|---|---|
|**name**|String|账号名|
|**status**|String|账号状态|
|**accountPrivileges**|RdsAccountPrivilege[]| |
|**cloudID**|String|所属云提供商ID|
### RdsAccountPrivilege
|名称|类型|描述|
|---|---|---|
|**dbName**|String|数据库名称|
|**privilege**|String|账号对数据库所具有的权限|
|**cloudID**|String|所属云提供商ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|instance not found, or accountName not found|
