# describeRecordBinding


## 描述
查询录制模板绑定


## 请求方式
GET

## 请求地址
https://live.jdcloud-api.com/v1/recordTemplates/{template}:binding

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**template**|String|True| |录制模板|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|requestId|

### Result
|名称|类型|描述|
|---|---|---|
|**bindingList**|TemplateBinding[]|录制模板模板绑定集合|
### TemplateBinding
|名称|类型|描述|
|---|---|---|
|**publishDomain**|String|推流域名|
|**appName**|String|应用名称|
|**streamName**|String|流名称|
|**template**|String|模板|

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
https://live.jdcloud-api.com/v1/recordTemplates/template:binding
```

## 返回示例
```
{
    "code": 200, 
    "requestId": "xxxxx", 
    "result": {
        "bindingList": [
            {
                "publishDomain": "push.yourdmain.com", 
                "template": "record-test"
            }, 
            {
                "appName": "live", 
                "publishDomain": "push.yourdmain.com", 
                "template": "record-test"
            }, 
            {
                "appName": "live", 
                "publishDomain": "push.yourdmain.com", 
                "streamName": "streamName", 
                "template": "record-test"
            }
        ]
    }
}
```
