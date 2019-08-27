# describeApps


## 描述
批量查询应用的信息，此接口支持分页查询，默认每页20条

## 请求方式
GET

## 请求地址
https://deploy.jdcloud-api.com/v1/regions/{regionId}/apps

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认为1|
|**pageSize**|Integer|False|20|分页大小；默认为20；取值范围[10, 100]|
|**filters**|Filter[]|False| |appId - 应用ID，精确匹配<br>appName - 应用名，精确匹配<br>platform - 部署平台，精确匹配<br>|
|**sorts**|Sort[]|False| |createTime - 创建时间,asc（正序），desc（倒序）<br>|

### Sort
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |排序条件的名称|
|**direction**|String|False| |排序条件的方向|
### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**apps**|App[]| |
|**totalCount**|Number| |
### App
|名称|类型|描述|
|---|---|---|
|**appId**|String|应用ID|
|**appName**|String|应用名称|
|**regionId**|String|地域|
|**platform**|Integer|部署平台：1云主机，2原生容器|
|**jdsfEnabled**|Integer|使用分布式服务框架：0不使用，1使用|
|**desc**|String|描述|
|**lastDeployTime**|Integer|上次部署时间|
|**createTime**|Integer|创建时间|
|**updateTime**|Integer|更新时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
