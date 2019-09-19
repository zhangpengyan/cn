### 描述

回源统计 (origin)

### 请求参数

| **名称**      | **类型** | **是否必填** | **描述**                          |
| ----------- | ------ | -------- | ------------------------------- |
| username      | String | 是        | 京东用户名pin                          |
| signature  | String | 是        | 用户签名                    |
| domain      | String | 是        | 需要下载日志的域名，支持多域名下载，参数示例"test1.jcloud.com,test2.jcloud.com" |
| start_time      | String | 是        | 时间格式：yyyy-mm-dd hh:mi 参考示例：2016-12-14 07:00 |
| end_time      | String | 否        | 不是必填参数，不传默认到当前时间 |


### 返回参数data中说明

| **名称**         | **描述**               |
| -------------- | -------------------- |
| status      | 结果状态 0，成功，其他失败            |
| msg | 提示信息                   |
| data | 返回数据   |

### 调用示例

##### 请求示例

```html
http://opencdn.jcloud.com/api/origin
{
	"username" :"test_user",
	"signature" :"d847267fc702273abf394dd0c3128d64",
	"domain" :"www.a.com,www.b.com",
	"start_time" :"2016-12-14 07:00",
	"end_time" :"2016-12-14 12:59"
 }


 ```

##### 返回说明

* json格式

```json
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
[
TS, //时间戳
BANDWIDTH, //回源带宽,单位:bps
PV, //回源请求数
{
CODE1 : CODE1_COUNT, // CODE1 为具体的状态码,如 206,
CODE1_COUNT 为 206 的个数
CODE2 : CODE2_COUNT, // CODE2 为具体的状态码,如 200,
CODE2_COUNT 为 200 的个数
}, //回源状态码
],
],
},
]
}




```

##### 返回示例
```json
{
    "status": 0,
    "msg": "成功",
    "data": [
        {
            "domain": "www.a.com",
            "data": [
                [
                    1568477100,
                    0,
                    1,
                    {
                        "0": 0,
                        "200": 0,
                        "201": 0,
                        "204": 0,
                        "206": 0,
                        "300": 0,
                        "301": 1,
                        "302": 0,
                        "464": 0,
                        "465": 0,
                        "466": 0,
                        "512": 0,
                        "605": 0,
                        "612": 0,
                        "613": 0,
                        "other": 0,
                        "000": 0
                    }
                ]
            ]
        }
    ]
}


```
