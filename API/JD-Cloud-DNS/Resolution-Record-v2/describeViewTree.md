# describeViewTree


## 描述
查询云解析所有的基础解析线路。  
在使用解析线路的参数之前，请调用此接口获取解析线路的ID。


## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/viewTree

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**loadMode**|Integer|False| |展示方式，暂时不使用|
|**packId**|Integer|True| |套餐ID，0->免费版 1->企业版 2->企业高级版|
|**viewId**|Integer|True| |view ID，默认为-1|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|ViewTree[]|解析线路的树|
### ViewTree
|名称|类型|描述|
|---|---|---|
|**disabled**|Boolean|此解析线路是否禁用|
|**label**|String|解析线路的描述|
|**leaf**|Boolean|此数据是否是叶子节点|
|**value**|Integer|解析线路ID|
|**viewName**|String|解析线路的名称，在使用viewName的参数处使用，如果为空表明此解析线路不能直接使用，请使用它的子线路。|
|**children**|ViewTree[]| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|
