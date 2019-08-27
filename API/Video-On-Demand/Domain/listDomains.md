# listDomains


## 描述
查询域名列表

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/domains


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认值为 1|
|**pageSize**|Integer|False|10|分页大小；默认值为 10；取值范围 [10, 100]|
|**sorts**|Sort[]|False| | |

### Sort
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |排序属性名|
|**direction**|String|False| |排序方向|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询域名列表结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**pageNumber**|Integer|当前页码|
|**pageSize**|Integer|每页数量|
|**totalElements**|Integer|查询总数|
|**totalPages**|Integer|总页数|
|**content**|DomainObject[]|分页内容|
### DomainObject
|名称|类型|描述|
|---|---|---|
|**id**|String|域名ID|
|**name**|String|域名名称|
|**cname**|String|域名CNAME|
|**status**|String|域名状态。取值范围：<br>  init - 初始状态<br>  configuring - 配置中<br>  normal - 正常<br>  stopped - 已停用<br>|
|**source**|String|域名来源。取值范围：<br>  system - 系统生成<br>  custom - 用户自建<br>|
|**asDefault**|Boolean|是否默认域名|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/domains

```

## 返回示例
```
{
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "content": [
            {
                "asDefault": true, 
                "cname": "221583-playvod.jdcloud.com.jdcloud-cdn.com", 
                "createTime": "2019-04-16T10:37:00Z", 
                "id": 1, 
                "name": "221583-playvod.jdcloud.com", 
                "status": "normal", 
                "type": "system", 
                "updateTime": "2019-04-16T10:37:00Z"
            }, 
            {
                "asDefault": false, 
                "cname": "vodplay.lomagicode.com.jdcloud-cdn.com", 
                "createTime": "2019-04-16T10:37:00Z", 
                "id": 2, 
                "name": "vodplay.lomagicode.com", 
                "source": "custom", 
                "status": "normal", 
                "updateTime": "2019-04-16T10:37:00Z"
            }
        ], 
        "pageNumber": 1, 
        "pageSize": 10, 
        "totalElements": 1, 
        "totalPages": 1
    }
}
```
