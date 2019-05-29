# **查询在线人数**

## **1. 描述**

查询每路流的在线人数。

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           |用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)|
| domain     | String   | 是           | 加速域名|
|app| String   | 否  |发布点，目前支持单个查询 |
|stream | String   | 否 | 流名称，目前支持单个查询|
|startTime | String   | 是 | 查询的开始时间 |
|endTime | String   | 否  | 查询的结束时间，当没有结束时间时，取当前时间； |
|isp | String   | 否 | 运营商|
|area| String   | 否  |地域 |
|groupByDomain | String   | 否 | 默认是false，false表示多个域名查询，查询的数据是域名之和，如果是true，表示多个域名查询，查询的数据是各个域名独自的数据信息|
|period  | String   | 否 |颗粒度：默认为一分钟，可以查询一分钟和五分钟粒度；当颗粒度为一分钟时，不按区域和运营商查询，查询的时间跨度是30天，按区域和运营商查询，查询的时间跨度是7天；当颗粒度是五分钟时，不按区域和运营商查询，查询的时间跨度是7天；按区域和运营商查询，查询的时间跨度是1天|

## **3. 返回参数**

| **名称**   | **描述** | 
| ---------- | -------- |
| domain| 查询域名  | 
|detail | 返回数据 | 
| startTime| 查询的开始时间| 
| endTime| 查询的结束时间| 
| area| 地域|
| isp| 运营商| 
| pv| 请求量| 
| onlineNumber| 在线人数| 

## **4. 调用示例**

- ### **请求地址**

https://opencdn.jcloud.com/api/live/streamOnlineNumber

- ### **请求示例**

```
{
    "username":"user_test",
    "signature":"5ca1d52777132a008ae30de039ec8cac",
    "domain":"test.live.com",
    "app":"live",
    "stream":"",
    "startTime":"2018-08-14 16:33",
    "endTime":"2018-08-14 16:35",
    "isp":"",
    "area":"",
    "groupByDomain":"false",
    "period":"oneMin"
    
}
```

- ### **返回示例**

```
{
    "status": 0,
    "msg": "",
    "data": [
        {
            "domain": "test.live.com",
            "data": [
                {
                    "startTime": "2018-08-14 16:33",
                    "endTime": "2018-08-14 16:34",
                    "area": "hubei",
                    "isp": "ct",
                    "pv": 9,
                    "onlineNumber": 2
                },
                {
                    "startTime": "2018-08-14 16:34",
                    "endTime": "2018-08-14 16:35",
                    "area": "hubei",
                    "isp": "ct",
                    "pv": 10,
                    "onlineNumber": 2
                }
            ]
        }
    ]
}
```
