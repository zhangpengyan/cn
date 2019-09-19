# getURLRule


## 描述
查询CDN域名URL鉴权规则配置

## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:getURLRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询CDN域名URL鉴权规则配置结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**ruleType**|String|规则类型，取值 'url'|
|**config**|URLRuleConfigObject|URL鉴权规则配置对象|
|**enabled**|Boolean|是否启用该规则|
### URLRuleConfigObject
|名称|类型|描述|
|---|---|---|
|**authType**|String|鉴权类型。取值范围：<br>  by_params - 参数鉴权<br>  by_path - 路径鉴权<br>|
|**authKey**|String|鉴权密钥|

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
https://vod.jdcloud-api.com/v1/domains/2:getURLRule

```

## 返回示例
```
{
    "code": 200, 
    "requestId": "edfc74ea-be4c-418b-b841-31ddd2b33203", 
    "result": {
        "config": {
            "authKey": "Secret001", 
            "authType": "by_params"
        }, 
        "enabled": true, 
        "ruleType": "url"
    }
}
```
