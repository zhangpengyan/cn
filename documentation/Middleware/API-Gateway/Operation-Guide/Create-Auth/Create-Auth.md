# API的访问授权

API的访问授权提供"免鉴权"和"授权访问"两种模式。

"免鉴权"模式即当 API 网关在收到匿名请求时，也可以通过认证授权。"授权访问"模式即API提供方给API调用方授权应用的过程，授权过程分为两部分：
#### （1）API调用方创建和提供密钥 。密钥代表请求者的身份。
#### （2）API提供方将API分组授权给API调用方，供其使用。
当API提供方的客户或提供方自身需要测试调用 API 时，都需要作为请求者的身份创建密钥，然后由API提供方在“访问授权”模块中，将API分组授权给API调用者使用。
其中授权访问模式可支持三种授权类型：订阅密钥、API网关签名、京东云用户签名。

## 三种授权类型的简介如下:

### （1）订阅密钥

京东云API网关支持订阅密钥的授权类型。用户除了选择利用SDK的方式对API进行访问， 还可以通过在header中传递订阅密钥（jdcloud-apim-subscription-key）来实现API的授权访问。使用订阅密钥进行授权访问的成本很低且方便快捷，同时也能保障一定的安全性，因此非常适合想快速进行API调用的用户。
详情请见[订阅密钥](https://docs.jdcloud.com/cn/api-gateway/subscription-key?SOP=JDCloud)。

### （2）API网关签名密钥

京东云API网关支持签名密钥的授权类型。API网关针对此授权类型采用了特殊的签名算法，因此具有极高的安全性，授权完成后用户可使用SDK对API进行调用。
详情请见[签名密钥](https://docs.jdcloud.com/cn/api-gateway/signature-key?SOP=JDCloud)。

### （3）京东云用户签名Access Key

京东云API网关支持京东云用户签名的授权类型。该授权类型的密钥来源于用户在京东云的账户管理中所创建的Access Key， 授权完成后用户可使用SDK对API进行调用。API网关则可对其进行后端签名校验。
详情请见[京东云用户签名Access Key](https://docs.jdcloud.com/cn/api-gateway/jd-cloud-user-signature?SOP=JDCloud)。
 

 








  
