# 应用管理

创建应用、[接入京东云OAuth2](../../../documentation/Identity-Authentication-Service/Application-Management/OAuth2.md)的总体流程如下：</br>

![](../../../image/Identity-Authentication-Service/Application-Management/app-flow2.png)

您可以在京东云[身份管理控制台](https://ias-console.jdcloud.com/ias/apps)创建、管理应用程序。</br>

## 创建应用

在应用管理列表页，点击“创建”按钮，可以开始创建应用。</br>

![](../../../image/Identity-Authentication-Service/Application-Management/1-apps-list.png)
![](../../../image/Identity-Authentication-Service/Application-Management/2-create-app.png)

**各字段填写说明**

|字段名|字段说明|字段值描述|
|---|---|---|
|应用名|应用的名称|任意字符，长度为1-255|
|客户端密码验证方式|在京东云将访问令牌颁发给应用前，需要先验证应用的身份，防止其他客户端伪造应用请求。应用可以事先设置一个密码，在请求令牌时，向京东云发送应用ID和密码，完成验证|选择不同的选项，在京东云OAuth2的令牌端点申请访问令牌时，应采用不同的方式进行应用的身份验证。</br>- HTTP基础身份认证：京东云推荐的默认选项。选择该选项，需要设置应用密码，并使用HTTP基础身份认证方案（HTTP Basic authentication scheme）进行应用的身份认证，即，在令牌端点的请求头部包含应用ID和密码的编码信息</br>- 通过请求参数验证：当无法使用HTTP基础身份认证方案时可选择该选项，需要设置应用密码，并在令牌端点的请求参数中包含应用ID和密码信息</br>- 不验证客户端密码：不设置应用密码。在令牌端点不使用密码验证，而是通过代码质询验证实现应用身份验证|
|---|---|---|
|---|---|---|
|---|---|---|
|---|---|---|
|---|---|---|
