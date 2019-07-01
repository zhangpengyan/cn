# getViewTree


## 描述
查询云解析所有的基础解析线路。<br>
在使用解析线路的参数之前，请调用此接口获取解析线路的ID。


## 请求方式
GET

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/domain/{domainId}/viewTree

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|String|True| |域名ID，请使用getDomains接口获取。|
|**regionId**|String|True| |实例所属的地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**loadMode**|Integer|False| |展示方式，暂时不使用|
|**packId**|Integer|True| |套餐ID，0->免费版 1->企业版 2->企业高级版|
|**viewId**|Integer|True| |view ID，默认为0|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**data**|ViewTree[]|解析线路的树|
### ViewTree
|名称|类型|描述|
|---|---|---|
|**children**|ViewTree[]| |
|**disabled**|Boolean|此解析线路是否禁用|
|**label**|String|解析线路的名称|
|**leaf**|Boolean|此数据是否是叶子节点|
|**value**|Integer|解析线路ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
