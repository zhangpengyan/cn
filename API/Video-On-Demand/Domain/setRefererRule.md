# setRefererRule


## 描述
设置CDN域名Referer防盗链规则

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:setRefererRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**config**|RefererRuleConfigObject|True| |Referer防盗链规则配置对象|
|**enabled**|Boolean|True| |是否启用该规则|

### RefererRuleConfigObject
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**strategy**|String|True| |启用策略。取值范围：<br>  denial - 拒绝<br>  allowance - 允许<br>|
|**domains**|String[]|True| |Referer域名列表|
|**allowBlank**|Boolean|True| |是否允许请求头 Referer 为空，如允许浏览器直接访问等|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


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
POST
```
https://vod.jdcloud-api.com/v1/domains/2:setRefererRule

```
```
{
    "config": {
        "allowBlank": false, 
        "domains": [
            "example1.lomagicode.com", 
            "example2.lomagicode.com"
        ], 
        "strategy": "allowance"
    }, 
    "enabled": true
}
```

