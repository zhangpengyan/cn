# **回源策略变更**

## **1. 描述**

更改拉流模式下的回源策略信息

## **2. 请求参数**
| **名称**       | **类型** | **是否必填** | **描述**                                                     |
| -------------- | -------- | ------------ | ------------------------------------------------------------ |
| username       | String   | 是           | 京东用户名pin                                                |
| signature      | String   | 是           | 用户签名，通过md5的方式校验用户的身份信息，保障信息安全。</br>md5=日期+username+秘钥SecretKey; 日期：格式为 yyyymmdd; username：京东用户名pin; 秘钥：双方约定; </br>示例：比如当前日期2016-10-23,用户pin:jcloud_00,用户秘钥SecretKey：e7a31b1c5ea0efa9aa2f29c6559f7d61,那签名为MD5(20161023jcloud_00e7a31b1c5ea0efa9aa2f29c6559f7d61)|
| domain         | String   | 是           | 加速域名  |
| sourceType     | String   | 是           |回源类型，ips：IP回源；domain：域名回源|
| source         | String   | 是           | 根据sourceType确定源站IP列表或者域名。</br>IP回源分为主备IP，当主或备源为多个ip时，每个回源ip的权重ratio是平均分配，暂时不支持自定义设置ip权重，ratio可以不传或者值为空，回源IP最多添加10个；</br>域名回源分优先级，priority表示优先级，回源域名最多可以添加5个   |

## **3. 返回参数**

| **名称** | **描述**                                                  |
| -------- | --------------------------------------------------------- |
| status   | 结果状态，表示接口请求成功与否，成功用0表示，其他表示失败 |
| msg      | 提示信息                                                  |
| data     | 返回数据                                                  |

## **4. 调用示例**

- ### **请求地址**

https://opencdn.jcloud.com/api/live/setBacksource

- ### **请求示例**

```
{
  "username": "jd_cdn",
  "signature": "7a9beb5119e1cb439208e444193d39ec",
  "domain":"a.jcloud.com",
  "sourceType":"ips",
  "source":{
  "ips": {
    "master": {
      "1.1.1.1": {
        "ratio": “”
      }
    }
  },
  "domain": {
    "a.baidu.com": {
      "priority": 1
    },
    "c.jd.com": {
      "priority": 2
    }
     }
    }
}

```

- ### **返回示例**

* json格式

```
{
    "status": 0,
    "msg": "",
    "data": {
        "sourceType": "ips",
        "source": {
            "ips": {
                "master": {
                    "1.1.1.1": {
                        "ratio": 1
                        }
                    }
                },
                "domain": {
                    " a.baidu.com ": {
                        "priority": 1
                    },
                    "c.jd.com": {
                        "priority": 2
                    }
                }
            }
        }
    }

```

 
