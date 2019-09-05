# downloadCert


## 描述
下载证书<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>

## 请求方式
POST

## 请求地址
https://ssl.jdcloud-api.com/v1/sslCert/:download

## 请求参数
| 名称       | 类型   | 是否必需 | 默认值 | 描述                                                |
| ---------- | ------ | -------- | ------ | --------------------------------------------------- |
| **certId** | String | True     |        | 证书 Id,以逗号分隔多个Id                           |
| **serverType** | String | True     |        | 证书应用的服务器类型(Nginx Apache Tomcat IIS Other) |


## 返回参数
| 名称          | 类型   | 描述         |
| ------------- | ------ | ------------ |
| **result**    | Result |              |
| **requestId** | String | 请求的标识Id |

### Result
| 名称         | 类型               | 描述 |
| ------------ | ------------------ | ---- |
| **certDesc** | DownloadCertDesc[] |      |
### DownloadCertDesc
| 名称                 | 类型   | 描述                                   |
| -------------------- | ------ | -------------------------------------- |
| **certId**           | String | 证书Id                                 |
| **certName**         | String | 证书名称                               |
| **keyFile**          | String | 私钥                                   |
| **certFile**         | String | 证书                                   |
| **digest**           | String | 对私钥文件使用sha256算法计算的摘要信息 |
| **caCertFile**           | String | 中间证书                               |
| **serverType**           | String | 证书应用服务器类型                     |
| **certEncryptePassword** | String | 证书加密密码                           |
| **commonName**           | String | 域名                                   |

## 返回码
| 返回码  | 描述                  |
| ------- | --------------------- |
| **200** | OK                    |
| **400** | Invalid parameter     |
| **401** | Authentication failed |
| **404** | Not found             |
| **500** | Internal server error |
| **503** | Service unavailable   |
