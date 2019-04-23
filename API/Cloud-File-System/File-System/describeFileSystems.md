# describeFileSystems


## 描述
-   查询文件系统列表。
-   filters多个过滤条件之间是逻辑与(AND)，每个条件内部的多个取值是逻辑或(OR)


## 请求方式
GET

## 请求地址
https://cfs.jdcloud-api.com/v1/regions/{regionId}/fileSystems

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码, 默认为1, 取值范围：[1,∞)|
|**pageSize**|Integer|False|20|分页大小，默认为20，取值范围：[10,100]|
|**filters**|Filter[]|False| |fileSystemId - 文件系统ID，精确匹配，支持多个<br>name - 文件系统名称，模糊匹配，支持单个<br>status - 文件系统状态，精确匹配，支持多个 FileSystem Status/creating、available、in-use<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询结果集|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**fileSystems**|FileSystem[]|文件系统信息列表|
|**totalCount**|Integer|查询的文件系统数目|
### FileSystem
|名称|类型|描述|
|---|---|---|
|**fileSystemId**|String|文件系统ID|
|**name**|String|文件系统名称(参数规则：不可为空，只支持中文、数字、大小写字母、英文下划线“_”及中划线“-”，且不能超过32字符)|
|**description**|String|文件系统描述(参数规则：不能超过256字符)|
|**numberOfMountTargets**|Integer|挂载目标个数|
|**sizeByte**|SizeByte|最近一次统计的文件系统的使用量单位为:Byte|
|**status**|String|文件系统状态(创建中:creating、可用:available、使用中:in-use、删除中:deleting)|
|**createTime**|String|创建时间|
|**dnsName**|String|dns名称|
### SizeByte
|名称|类型|描述|
|---|---|---|
|**timestamp**|String|时间戳|
|**value**|Integer|文件系统使用量，单位为:Byte|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**500**|Internal server error|
|**503**|Service unavailable|
