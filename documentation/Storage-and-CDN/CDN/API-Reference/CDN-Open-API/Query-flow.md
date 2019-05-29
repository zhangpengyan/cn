# **流量查询**

## **1. 描述**

流量查询 (flow)

说明

* 五分钟粒度的流量取值范围是当前时间点向前五分钟取值，例如：13:25分钟这个点的数据，取值时间范围是13:20-13:25的数据；

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)  |
| domain     | String   | 是           | 待查询的域名，支持多域名查询，参数示例“www.a.com,www.b.com”  当domain为空时，查询的是该usename下全部域名的带宽总和  |
| start_time | String   | 是           | 时间格式：yyyy-mm-dd hh:mi 参考示例：2016-12-14 07:00；查询时间跨度不能超过31天       |
| end_time   | String   | 否           | 不是必填参数，不传默认到当前时间                             |


## **3. 返回参数**

| **名称** | **描述**                       |
| -------- | ------------------------------ |
| status   | 结果状态 0，刷新成功，其他失败 |
| msg      | 提示信息                       |
| data     | 返回数据                       |


## **4. 调用示例**

- ### **请求地址**

https://opencdn.jcloud.com/api/flow

- ### **请求示例**

```
https://opencdn.jcloud.com/api/flow
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```

- ### **返回说明**

•        json格式

```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
[
TS,//时间戳
FLOW,//流量,单位MB
HIT_FLOW//命中流量，单位MB
],
],
},
]
}
```

- ### **返回示例**

```
{
  "status": 0,
  "msg": "成功",
  "data": [
    {
      "domain": "www.a.com",
      "data": [
        [
          1480989960,
      1,
          1
        ],
        [
          1480990860,
      901,
          901
        ]
      ]
    },
    {
      "domain": "www.b.com",
      "data": [
        [
          1480989960,
      100,
          100
        ],
        [
          1480990860,
      1001,
          1000
        ]
      ]
    }
  ]
}
```
