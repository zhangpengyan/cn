# 初始化创建

##  1. 密钥创建
在调用消息队列 JCQ的SDK或者openAPI进行消息的发送消费和管理操作时候，需要验证用户的身份信息来验证用户身份的合法性，即需要在控制台创建AccessKey和 SecretKey或者使用已创建的密钥。

### 创建方法：
在京东云用户中心账户管理下的[AccessKey管理页面](https://uc.jdcloud.com/account/accesskey)申请AccessKey和SecretKey密钥对（简称AK/SK）。 AK/SK信息请妥善保管，如果遗失可能会造成非法用户使用此信息操作您在云上的资源，给你造成数据和财产损失。AK/SK密钥对允许启用、禁用，启用后可用其调用OpenAPI，禁用后不能用其调用OpenAPI。

## 2. 资源创建

请在控制台或者调用OpenAPI创建topic，consumerGroup来获取Topic和ConsumerGroup ID，并获取所创建topic的接入点。

获取接入点在控制台方法:

1. 找到想要获取接入点的topic，点击操作列的“获取接入点“。
![获取接入点1](https://github.com/jdcloudcom/cn/blob/MessageQueue/image/Internet-Middleware/Message-Queue/获取接入点1.png)
2. 点击复制获取不同方式的topic接入点。
![获取接入点2](https://github.com/jdcloudcom/cn/blob/MessageQueue/image/Internet-Middleware/Message-Queue/获取接入点2.png)

在创建完上述资源后，可以在程序中进行初始化

```Java
/**
 * 用户accessKey
 */
private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
/**
 * 用户secretKey
 */
private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
/**
 * 元数据服务器地址（接入点地址）
 */
private static final String META_SERVER_ADDRESS = "127.0.0.1:18888";
/**
 * topic名称
 */
private static final String TOPIC = "testTopic";
/**
 * 消费组Id
 */
private static final String CONSUMER_GROUP_ID = "testConsumerGroup";
```
