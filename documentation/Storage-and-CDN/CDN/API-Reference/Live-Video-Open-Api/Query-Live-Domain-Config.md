# **查询域名配置信息**

## **1. 描述**

查询域名下的配置信息，目前只支持单个域名的查询

## **2. 请求参数**

| **名称**   | **类型** | **是否必填** | **描述**                                                     |
| ---------- | -------- | ------------ | ------------------------------------------------------------ |
| username   | String   | 是           | 京东用户名pin                                                |
| signature  | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)|
| domain     | String   | 是           | 加速域名，目前只支持查询单个域名的配置信息|

## **3. 返回参数**

| **名称**   | **描述** | 
| ---------- | -------- |
| status  | 表示接口请求成功与否，成功用0表示，其他表示失败  | 
| msg  | 提示信息 | 
| data | 返回数据| 
| accessKeyType | 鉴权类型，0表示无鉴权，1表示有鉴权 | 
| audioType |音频格式，默认aac | 
|blackIpList| IP黑名单 | 
|blackIpListEnable | 是否开启IP黑名单，on表示开启，off表示关闭  | 
|cname | 别名记录 | 
|originDomain| 回源域名 | 
| protocolConvert|转协议  | 
|source | 回源参数内容，根据sourceType确定源站IP列表或者域名 | 
| sourceType|回源类型，域名回源或者是ip回源| 
|status | 域名状态：offline表示为停止，online表示运行，configuring表示配置中| 
|videoType| 视频格式，默认是h264 | 
|type |业务类型，live表示视频云直播| 
| createTime | 域名创建成功时间 | 
|forwardCustomVhost| 转推域名| 
| sourceHost| 回源host | 
| archiveNo | 备案号 | 
|referType | Referer类型，block表示黑名单，allow表示白名单 | 
|referList| Referer参数内容 | 
|referAllowEmpty | 是否允许referer值为空或者不规则内容访问url资源，on表示允许，off表示禁止 | 
| referAllowNull | 是否允许无referer头访问url资源，on表示允许，off表示禁止 | 
|accesskeyKey | 鉴权秘钥| 
|pushIpWhiteList | 推流白名单| 
|publishNormalTimeout | 推流中断超时时间 | 


## **4. 调用示例**

- ### **请求地址**

https://opencdn.jcloud.com/api/live/queryDomainConfig

- ### **请求示例**

```
{
    "username": "user_test",
    "signature": "7a9beb5119e1cb439208e444193d39ec",
    "domain":"test.jcloud.com"
    
}
```

- ### **返回示例**
```
{
    "status": 0,
    "msg": "",
    "data": {
        "accessKeyType": 0,
        "audioType": "AAC",
        "allowApps": "",
        "backSourceType": "",
        "blackIpList": "",
        "blackIpListEnable": "off",
        "ignoreQueryString": "off",
        "cname": "test.jcloud.com.live-publish.galileo.jcloud-cdn.com",
        "originDomain": "",
        "protocolConvert": "rtmp>http-flv,rtmp>http-hls",
        "siteType": "1",
        "source": "",
        "sourceType": "ips",
        "status": "configuring",
        "videoType": "H.264",
        "type": "live",
        "createTime": "2018-07-30T19:59:41",
        "forwardCustomVhost": "",
        "sourceHost": "",
        "archiveNo": "京ICP备11041704号-6",
        "referType": "block",
        "referList": "",
        "referAllowEmpty": "on",
        "referAllowNull": "on",
        "accesskeyKey": "",
        "pushIpWhiteList": "",
        "publishNormalTimeout": 0
    }
}
```
