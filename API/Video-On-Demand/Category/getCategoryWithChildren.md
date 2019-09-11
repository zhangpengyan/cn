# getCategoryWithChildren


## 描述
查询分类及其子分类，若指定的分类ID为0，则返回一个根分类及其子分类（即一级分类）.

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/categories/{categoryId}:getWithChildren

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**categoryId**|Long|True| |分类ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询分类及其子分类结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**id**|Long|分类ID|
|**name**|String|分类名称|
|**level**|Integer|分类级别|
|**description**|String|分类描述|
|**children**|SubCategory[]|下级分类|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### SubCategory
|名称|类型|描述|
|---|---|---|
|**id**|Long|分类ID|
|**name**|String|分类名称|
|**level**|Integer|分类级别|
|**description**|String|分类描述|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
## 返回示例
```
{
    "code": 200, 
    "requestId": "082b1779-8617-42ec-a396-c9e5992c273a", 
    "result": {
        "children": [
            {
                "createTime": "2019-03-08T12:06:44Z", 
                "description": null, 
                "id": 405, 
                "level": 2, 
                "name": "科幻", 
                "updateTime": "2019-07-09T05:52:13Z"
            }
        ], 
        "createTime": "2019-03-08T12:06:39Z", 
        "description": null, 
        "id": 404, 
        "level": 1, 
        "name": "电影", 
        "updateTime": "2019-07-09T05:52:06Z"
    }
}
```
