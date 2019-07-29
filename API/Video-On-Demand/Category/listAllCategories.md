# listAllCategories


## 描述
查询所有分类

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/categories:listAll


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**flatMode**|Boolean|False| |是否返回平坦结构结果|
|**treeMode**|Boolean|False| |是否返回树结构结果|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询所有分类结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**flatResult**|CategoryObject[]|平坦结构结果|
|**treeResult**|CategoryTreeNode|树结构结果|
### CategoryTreeNode
|名称|类型|描述|
|---|---|---|
|**id**|Long|分类ID|
|**name**|String|分类名称|
|**level**|Integer|分类级别|
|**description**|String|分类描述信息|
|**children**|CategoryTreeNode[]|子分类|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### CategoryObject
|名称|类型|描述|
|---|---|---|
|**id**|Long|分类ID|
|**name**|String|分类名称|
|**level**|Integer|分类级别。取值范围为 [0, 3]，取值为 0 时为虚拟根节点<br>|
|**parentId**|Long|父分类ID，取值为 0 或 null 时，表示该分类为一级分类<br>|
|**description**|String|分类描述信息|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**401**|Authentication failed|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/categories:listAll

```

## 返回示例
```
{
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "flatResult": [
            {
                "createTime": "2019-04-16T15:51:32Z", 
                "description": "description", 
                "id": 1, 
                "level": 1, 
                "name": "TV", 
                "parentId": 0, 
                "updateTime": "2019-04-16T15:51:32Z"
            }
        ], 
        "treeResult": {
            "children": [
                {
                    "createTime": "2019-04-16T15:51:32Z", 
                    "description": "description", 
                    "id": 1, 
                    "level": 1, 
                    "name": "TV", 
                    "parentId": 0, 
                    "updateTime": "2019-04-16T15:51:32Z"
                }
            ], 
            "createTime": "1970-01-01T00:00:00Z", 
            "description": "Virtual root category", 
            "id": 0, 
            "level": 0, 
            "name": "ROOT", 
            "updateTime": "1970-01-01T00:00:00Z"
        }
    }
}
```
