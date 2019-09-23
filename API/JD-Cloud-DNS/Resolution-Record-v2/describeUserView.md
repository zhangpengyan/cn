# describeUserView


## 描述
查询主域名的自定义解析线路

## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/UserView

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**viewId**|Integer|True| |自定义线路ID|
|**viewName**|String|False| |自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**pageNumber**|Integer|True| |分页参数，页的序号|
|**pageSize**|Integer|True| |分页参数，每页含有的结果的数目|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|UserViewInput[]|自定义线路列表|
|**currentCount**|Integer|当前页的自定义线路列表里的个数|
|**totalCount**|Integer|所有自定义线路列表的个数|
|**totalPage**|Integer|所有自定义线路列表按照分页参数一共的页数|
### UserViewInput
|名称|类型|描述|
|---|---|---|
|**viewId**|Integer|自定义线路ID|
|**viewName**|String|自定义线路名称, 最多64个字节，允许：数字、字母、下划线，-，中文|
|**domainId**|Integer|主域名ID|
|**ipRanges**|String[]|用户输入的IP段，IPV4支持1.1.1.1-2.2.2.2和CIDR格式，IPV6仅支持CIDR格式|
|**isDelete**|Integer|是否删除，0:没有删除，1:已删除|
|**creator**|String|创建者|
|**createTime**|Integer|创建时间，格式Unix timestamp，时间单位：秒|
|**updator**|String|更新者|
|**updateTime**|Integer|更新时间，格式Unix timestamp，时间单位：秒|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
