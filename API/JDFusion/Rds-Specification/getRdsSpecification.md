# getRdsSpecification


## 描述
根据数据库类型，取得RDS实例的规格

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/rds_specification/{engine}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**engine**|String|True| |RDS数据库引擎，目前只支持mysql|
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
|**specifications**|RdsSpecification[]| |
### RdsSpecification
|名称|类型|描述|
|---|---|---|
|**instanceClass**|String|规格编号|
|**cpu**|Integer|CPU核数|
|**memoryGB**|Integer|内存大小|
|**disk**|RdsSpecificationDisk| |
### RdsSpecificationDisk
|名称|类型|描述|
|---|---|---|
|**list**|Integer[]|硬盘大小列表|
|**min**|Integer|硬盘最小值|
|**max**|Integer|硬盘最大值|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
