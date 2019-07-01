# describeAlarmContacts


## 描述
查询规则的报警联系人

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/alarms/{alarmId}/contacts

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**alarmId**|String|True| |规则id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**referenceType**|Long|False| |联系人类型。0,联系人分组; 1,联系人|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**contactsList**|DescribedNoticeContacts[]|报警联系人列表|
|**total**|Long|报警联系人总数|
### DescribedNoticeContacts
|名称|类型|描述|
|---|---|---|
|**referenceId**|Long|联系人ID|
|**referenceType**|Long|联系人类型。 0 - 联系人分组id， 1 - 联系人id|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询报警联系人|
