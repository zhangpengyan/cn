# getRefererRule


## 描述
查询CDN域名Referer防盗链规则配置

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:getRefererRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询CDN域名Referer防盗链规则配置结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**ruleType**|String|规则类型，取值 'referer'|
|**config**|RefererRuleConfigObject|Referer防盗链规则配置对象|
|**enabled**|Boolean|是否启用该规则|
### RefererRuleConfigObject
|名称|类型|描述|
|---|---|---|
|**strategy**|String|启用策略。取值范围：<br>  denial - 拒绝<br>  allowance - 允许<br>|
|**domains**|String[]|Referer域名列表|
|**allowBlank**|Boolean|是否允许请求头 Referer 为空，如允许浏览器直接访问等|

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
https://vod.jdcloud-api.com/v1/domains/2:getRefererRule

```

## 返回示例
```
{
    "code": 200, 
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "config": {
            "allowBlank": false, 
            "domains": [
                "www.lomagicode.com", 
                "www.luomo.io"
            ], 
            "strategy": "allowance"
        }, 
        "enabled": true, 
        "ruleType": "referer"
    }
}
```
