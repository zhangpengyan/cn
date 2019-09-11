# getCategory


## 描述
查询分类

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/categories/{categoryId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**categoryId**|Long|True| |分类ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询分类结果|
|**requestId**|String|请求ID|

### Result
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
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/categories/1

```

## 返回示例
```
{
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "createTime": "2019-04-16T15:51:32Z", 
        "description": "description", 
        "id": 1, 
        "level": 1, 
        "name": "TV", 
        "parentId": 0, 
        "updateTime": "2019-04-16T15:51:32Z"
    }
}
```
