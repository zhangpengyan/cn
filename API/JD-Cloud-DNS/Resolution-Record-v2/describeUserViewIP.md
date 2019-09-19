# describeUserViewIP


## 描述
查询主域名的自定义解析线路的IP段

## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/UserViewIP

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**viewId**|Integer|True| |自定义线路ID|
|**viewName**|String|False| |自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**pageNumber**|Integer|True| |分页参数，页的序号, 默认为1|
|**pageSize**|Integer|True| |分页参数，每页含有的结果的数目，默认为10|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|String[]|自定义线路包含的IP段列表|
|**currentCount**|Integer|当前页的IP列表里的个数|
|**totalCount**|Integer|IP列表里的IP段的个数|
|**totalPage**|Integer|IP列表按照分页参数一共的页数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
