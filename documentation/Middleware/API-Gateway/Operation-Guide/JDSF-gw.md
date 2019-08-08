# 微服务网关

当您在京东云上通过微服务平台创建了自有微服务应用后，可以通过京东云API网关将其发布到公网供客户调用，在此过程中就需要微服务网关来发挥作用。

以下过程将指导您完成在API网关控制台中使用微服务网关作为后端服务，进行微服务API分组调用的过程。


## 操作步骤：

#### 1. 登录API网关控制台，打开[API分组管理](https://apigateway-console.jdcloud.com/apiGroupList)。

#### 2. 点击“创建分组”按钮。

![创建分组](../../../../image/Internet-Middleware/API-Gateway/example_subkey_group.png)

#### 3. 在新建API分组页面，填写API分组信息。API分组类型选择“微服务API分组”。可选择“开启访问授权”或“免鉴权”模式。

![新建API](../../../../../image/Internet-Middleware/API-Gateway/apigroup-addapi.png)
   
#### 4. 点击确定，提示创建成功，在API分组列表页中点击“绑定”按钮。若还未创建微服务网关服务，则需要先在“微服务平台”创建微服务网关服务（详情请见[微服务网关](https://jdsf-console.jdcloud.com/gateway?regionId=cn-north-1)）。若已创建微服务网关服务，则可选择一个微服务网关，对目标API分组及其所属区域、发布环境进行绑定。


#### 5. 绑定成功后，可以在API网关对微服务API分组进行发布，后端服务即为微服务网关服务。

#### 6. 发布成功后，可以在该API分组的发布列表中查看发布详情。

#### 7. 接下来进行访问授权过程。用户需要先获取自己或其他用户的[订阅密钥](https://apigateway-console.jdcloud.com/subscriptionKey)、[签名密钥](https://apigateway-console.jdcloud.com/accessSecretKey)或[京东云用户Access Key](https://uc.jdcloud.com/account/accesskey)相关信息，再在API网关的[访问授权](https://apigateway-console.jdcloud.com/authorizationList)模块中绑定对应的微服务API分组。

#### 8. 针对该微服务API分组，在“更多“中选择“生成SDK和文档”，进行SDK和文档生成及下载。

#### 9. 接下来即可使用SDK对微服务API分组进行访问。
(1)通过通过Java SDK调用






