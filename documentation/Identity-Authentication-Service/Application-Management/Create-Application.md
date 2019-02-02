# 应用管理

您可以在京东云[身份管理控制台](https://ias-console.jdcloud.com/ias/apps)创建、管理应用程序。</br>
创建应用、[接入京东云OAuth2](../../../documentation/Identity-Authentication-Service/Application-Management/OAuth2.md)的总体流程如下：</br>

![](../../../image/Identity-Authentication-Service/Application-Management/app-flow.png)

下面介绍如何创建应用及注意要点。</br>

## 创建应用

在应用管理列表页，点击“创建”按钮，可以开始创建应用。</br>

![](../../../image/Identity-Authentication-Service/Application-Management/1-apps-list.png)
![](../../../image/Identity-Authentication-Service/Application-Management/2-create-app.png)

**各字段填写说明**

|字段名|字段说明|字段值描述|
|---|---|---|
|应用名|应用的名称，例如填写“XXX”，则将向用户显示“您正在授权XXX获取您的京东云用户名”|任意字符，长度为1-255|
|客户端密码验证方式|在京东云将访问令牌颁发给应用前，需要先验证应用的身份，防止其他客户端伪造应用请求。应用可以事先设置一个密码，在请求令牌时，向京东云发送应用ID和密码，完成验证|* HTTP基础身份认证：即HTTP Basic authentication scheme。|
|---|---|---|
|---|---|---|
|---|---|---|
|---|---|---|
|---|---|---|
