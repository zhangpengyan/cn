# getUserView


## 描述
查询域名的自定义解析线路

## 请求方式
GET

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/userview/getUserView

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Integer|True| |主域名ID|
|**pageNumber**|Integer|True| |分页参数，页的序号|
|**pageSize**|Integer|True| |分页参数，每页含有的结果的数目|
|**viewId**|Integer|True| |自定义线路ID|
|**viewName**|Integer|False| |自定义线路名称, 最多64个字符|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**currentCount**|Integer|当前页的自定义线路列表里的个数|
|**dataList**|UserViewInput[]|自定义线路列表|
|**totalCount**|Integer|所有自定义线路列表的个数|
|**totalPage**|Integer|所有自定义线路列表按照分页参数一共的页数|
### UserViewInput
|名称|类型|描述|
|---|---|---|
|**createTime**|Integer|创建时间，格式Unix timestamp，时间单位：秒|
|**creator**|String|创建者|
|**domainId**|Integer|域名ID|
|**ipRanges**|String[]|用户输入的IP段|
|**isDelete**|Integer|是否删除，0:没有删除，1:已删除|
|**updateTime**|Integer|更新时间，格式Unix timestamp，时间单位：秒|
|**updator**|String|更新者|
|**viewId**|Integer|自定义线路ID|
|**viewName**|String|自定义线路名称, 最多64个字符|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
