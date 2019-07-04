# queryMyCustomerList


## 描述
查询客户信息

## 请求方式
POST

## 请求地址
https://partner.jdcloud-api.com/v1/regions/{regionId}/customerManage/queryMyCustomerList

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| | |

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**customerPin**|String|False| |客户pin（客户账户）|
|**aliasName**|String|False| |客户昵称|
|**startRelTime**|String|False| |关联开始时间（格式：yyyy-MM-dd HH:mm:ss）|
|**endRelTime**|String|False| |关联结束时间（格式：yyyy-MM-dd HH:mm:ss）|
|**pageIndex**|Integer|False| |当前页序号|
|**pageSize**|Integer|False| |当前条数|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**pagination**|Pagination| |
|**result**|Customer[]| |
### Customer
|名称|类型|描述|
|---|---|---|
|**id**|Integer|ID|
|**pin**|String|客户pin|
|**distributorId**|String|渠道商ID|
|**distributorPin**|String|渠道商PIN|
|**distributorName**|String|渠道商名称|
|**distributorLevel**|String|渠道商级次|
|**relTime**|String|关联时间|
|**source**|Integer|来源(0渠道商自身,1京东云客户)|
|**aliasName**|String|客户昵称|
|**contracter**|String|客户联系人|
|**tel**|String|客户电话|
|**email**|String|客户邮箱|
|**remark**|String|客户备注|
|**createTime**|String|创建时间|
|**createUser**|String|创建人|
|**updateTime**|String|修改时间|
|**updateUser**|String|修改人|
|**accountTypeName**|String|账户类型|
|**realName**|String|实名标识名称|
|**name**|String|名称|
|**yn**|Integer|是否删除0未删除,1已删除|
### Pagination
|名称|类型|描述|
|---|---|---|
|**currPageNo**|Integer|当前页|
|**numberPages**|Integer|页数|
|**numberRecords**|Integer|每页记录数|
|**pageSize**|Integer|页面大小|
|**startIndex**|Integer|起始页|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
