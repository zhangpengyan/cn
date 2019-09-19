# openLiveRestart


## 描述
开启回看<br>
1、直播回看文件格式仅支持m3u8。<br>
2、回看时长用户可以配置，最大支持7天，即用户请求回看内容，最多可以请求最近7天的直播回看内容。<br>
3、域名格式：http://{restartDomain}/{appName}/{streamName}/index.m3u8?starttime=1527756680&endtime=1527760280 (unix时间戳)<br>
4、starttime-endtime最长可支持24小时，可跨天<br>


## 请求方式
PUT

## 请求地址
https://live.jdcloud-api.com/v1/liveRestart:open


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**restartDomain**|String|True| |回看的播放域名|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|requestId|


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
PUT
```
https://live.jdcloud-api.com/v1/liveRestart:open
```

```
{
    "restartDomain": "restart.yourdomain.com"
}
```

## 返回示例
```
{
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41"
}
```
