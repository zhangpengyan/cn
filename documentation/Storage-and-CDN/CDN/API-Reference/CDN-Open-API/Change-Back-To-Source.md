# **回源策略变更**

## **1. 描述**

回源策略变更 (changeSource)

## **2. 请求参数**

| **名称**       | **类型** | **是否必填** | **描述**                                                     |
| -------------- | -------- | ------------ | ------------------------------------------------------------ |
| username       | String   | 是           | 京东用户名pin                                                |
| signature      | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey日期：格式为 yyyymmddusername：京东用户名pin;秘钥：双方约定;</br>示例：比如当前日期2016-10-23，用户pin:jcloud_00 ,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61;那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61) |
| domain         | String   | 是           | 加速域名                                                     |
| sourceType     | String   | 是           |1. 根据sourceType确定源站IP列表或者域名。</br>2. IP和domain回源必须是json格式。</br> 3. ip回源示例："[{'ip':'1.1.1.1','master':1,'ratio':0.4},{'ip':'1.1.1.2','master':1,'ratio':0.6}]"；ip回源时，1表示主IP，2表示备IP；ratio表示权重，权重值之和为1；</br>4. domain回源示例："[{'domain':'www.a.com','priority':'1',"sourceHost":"source.a.com"},{'domain':'www.b.com','priority':'2',"sourceHost":"source.b.com"}]"，domain回源时，priority代表的是域名优先级，1-5代表优先级从高到低；</br>5. sourceHost表示该回源域名或者回源IP对应的回源host，可针对IP回源或者域名回源设置；</br> 6.可自定义设置IP/域名回源端口，如"[{'ip':'1.1.1.1:8080','master':1}]". </br>7. OSS回源"oss.jcloud.com" |
| source         | String   | 是           | ips和domain必须是json格式   |
| httpType       | String   | 否           | http类型，只能为http或者https，默认为http。当设为https时，需要调用“设置通信协议”接口上传证书和私钥 |
| backSourceType | String   | 否           | 回源类型，只能为http（80端口回源）或者https（443端口回源），默认为http |

## **3. 返回参数**

| **名称** | **描述**                                                  |
| -------- | --------------------------------------------------------- |
| status   | 结果状态，表示接口请求成功与否，成功用0表示，其他表示失败 |
| msg      | 提示信息                                                  |
| data     | 返回数据                                                  |

## **4. 调用示例**

- ### **请求地址**

https://opencdn.jcloud.com/api/changeSource

- ### **请求示例**

curl请求示例： 

```
curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.b.com”, “type” :“web”,“sourceType” :“domain”,“source” :“[{’domain’:’source1.www.a.com’,’priority’:’1’},{’domain’:’source2.www.a.com’,’priority’:’2’}]”}’ http://opencdn.jcloud.com/api/changeSource
```

* json格式

```
https://opencdn.jcloud.com/api/changeSource
* 域名回源示例
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "type" :"web",
    "sourceType" :"domain",
    "source" :"[{'domain':'source1.a.com','priority':'1'},{'domain':'source2.a.com','priority':'2'}]"
 }
```
```
* IP回源示例

{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "type" :"web",
    "sourceType" :"ips",
    "source" :"[{'ip':'1.1.1.1','master':'1','ratio':0.6},{'ip':'2.2.2.2','master':'1','ratio':0.4},{'ip':'3.3.3.3','master':'2','ratio':'0.3'},{'ip':'4.4.4.4','master':'2','ratio':'0.7'}]"
 }
``` 
- ### **返回示例**

* json格式

```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```

 
