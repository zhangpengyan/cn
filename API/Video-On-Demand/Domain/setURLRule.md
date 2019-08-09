# setURLRule


## 描述
设置CDN域名URL鉴权规则

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:setURLRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**config**|URLRuleConfigObject|True| |URL鉴权规则配置对象|
|**enabled**|Boolean|True| |是否启用该规则|

### URLRuleConfigObject
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**authType**|String|True| |鉴权类型。取值范围：<br>  by_params - 参数鉴权<br>  by_path - 路径鉴权<br>|
|**authKey**|String|True| |鉴权密钥|

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
https://vod.jdcloud-api.com/v1/domains/2:setURLRule

```
```
{
    "config": {
        "authKey": "Secret001", 
        "authType": "by_params"
    }, 
    "enabled": true
}
```

