# describeStack


## 描述
查询资源栈详情

## 请求方式
GET

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/stacks/{stackId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**stackId**|String|True| |资源栈 ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**stack**|StackOut| |
### StackOut
|名称|类型|描述|
|---|---|---|
|**action**|String|资源栈运行操作|
|**canUpdate**|Boolean|资源栈能否更新|
|**createTime**|String|资源栈创建时间|
|**disableRollback**|Boolean|资源栈是否回滚设置|
|**id**|String|资源栈ID|
|**input**|Object|资源栈输入信息，JSON格式，此字段只在查询资源栈详情describeStack时有值|
|**name**|String|资源栈名称|
|**output**|Object|资源栈输出信息，JSON格式, 此字段只在查询资源栈详情describeStack时有值|
|**region**|String|资源栈所在区域|
|**stackVersion**|Long|资源栈版本|
|**status**|String|资源栈运行状态|
|**statusReason**|String|资源栈运行状态原因|
|**templateId**|String|资源栈使用的template ID|
|**timeout**|Long|资源栈超时时间|
|**updateTime**|String|资源栈更新时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|获取资源栈详情|
