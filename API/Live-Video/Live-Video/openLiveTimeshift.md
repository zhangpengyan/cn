# openLiveTimeShift


## 描述
开启时移

## 请求方式
PUT

## 请求地址
https://live.jdcloud-api.com/v1/liveTimeShift:open


## 请求参数
|名称|类型|是否必需|描述|
|---|---|---|---|
|**playDomain**|String|True|直播的推流域名|

## 示例
    {
       
        "playDomain":"play.yourdomain.com"
    }

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|ruquestId|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
