# setIPRule


## 描述
设置CDN域名IP黑名单规则

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/domains/{domainId}:setIPRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Long|True| |域名ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**config**|IPRuleConfigObject|True| |IP黑名单规则配置对象|
|**enabled**|Boolean|True| |是否启用该规则|

### IPRuleConfigObject
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ips**|String[]|True| |IP黑名单列表|

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
https://vod.jdcloud-api.com/v1/domains/2:setIPRule

```
```
{
    "config": {
        "ips": [
            "140.205.94.189", 
            "140.205.130.99"
        ]
    }, 
    "enabled": true
}
```

