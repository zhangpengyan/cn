# getDomain


## 描述
查询域名

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询域名结果|
|**requestId**|String|请求ID|

### Result
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
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/domains/2

```

## 返回示例
```
{
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "asDefault": false, 
        "cname": "vodplay.lomagicode.com.jdcloud-cdn.com", 
        "createTime": "2019-04-16T10:37:00Z", 
        "id": 2, 
        "name": "vodplay.lomagicode.com", 
        "source": "custom", 
        "status": "normal", 
        "updateTime": "2019-04-16T10:37:00Z"
    }
}
```
