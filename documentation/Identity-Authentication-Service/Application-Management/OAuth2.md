# 京东云OAuth2接入指引
## 一. 什么是京东云OAuth2
**OAuth2**（开放授权）是一个开放的标准授权协议，允许用户授权第三方应用访问该用户存储在服务商处的私密资源。用户无需向第三方应用共享自己在服务商处的用户名和密码，而是提供给第三方应用一个令牌，第三方应用即可使用该令牌来访问服务商处的用户资源。每一个令牌只能授权给一个特定的应用在特定的时间段内访问特定的资源，因此第三方应用无法访问未经用户授权的资源。</br>
OAuth2的更多说明，请参考其[官方网站](https://oauth.net/2/)。</br>

**京东云OAuth2**采用OAuth2协议来实现用户的身份验证和授权，在用户授权的基础上支持第三方应用获取用户身份，以及通过京东云OpenAPI访问用户在京东云的资源。</br>

## 二. 接入京东云OAuth2
京东云OAuth2支持网站或Web应用接入，接入流程如下：</br>
1. [创建应用](../../../documentation/Identity-Authentication-Service/Application-Management/Create-Application.md)，获取client_id；</br>
2. 根据[京东云OAuth2协议](#0)，开发应用：</br>
&emsp;2.1 在应用中[放置京东云登录按钮](#1)；</br>
&emsp;2.2 [获取用户的授权码](#2)；</br>
&emsp;2.3 [获取用户的访问令牌](#3)；</br>
&emsp;2.4 [获取用户的京东云账号](#4)；</br>
&emsp;2.5 如有必要，[刷新访问令牌](#5)；</br>
&emsp;2.6 如有必要，[撤销令牌](#6)。</br>

<h3 id="0">京东云OAuth2协议</h3>

**名词解释**</br>
资源所有者（Resource Owner）：终端用户</br>
客户代理（User-Agent）：浏览器</br>
客户端（Client）：第三方应用</br>
授权服务器（Authorization Server）：京东云授权服务器</br>

**授权流程**</br>

![](../../../image/Identity-Authentication-Service/Application-Management/authorization_code.png)

- (A) 用户通过浏览器访问应用，应用向京东云授权服务器发起登录请求（提供应用标识client_id、重定向URI、需要访问用户哪些资源），同时浏览器重定向到京东云登录页面；</br>
- (B) 用户登录京东云，京东云验证用户身份（通过是否成功登录），并询问用户是否同意授权应用访问自己的资源；</br>
- (C) 如果用户同意授权，京东云将浏览器重定向回应用指定的重定向URI，同时附上一个授权码；</br>
- (D) 应用收到授权码，用授权码向京东云申请令牌（同时再次提供它的重定向URI）;</br>
- (E) 京东云核对应用信息无误，向应用颁发用户的访问令牌和刷新令牌。</br>

通过上述流程，应用获得了用户的访问令牌。应用是否能凭借访问令牌访问用户的京东云资源，取决于用户在(B)步骤中是否同意授权。</br>

<h3 id="1">放置京东云登录按钮</h3>

京东云提供了几种标准图标供应用开发者[下载](../../../image/Identity-Authentication-Service/Application-Management/download-resource/jdcloud-icon.zip)。放置京东云登录按钮请参考下述标示。</br>

|图标|标示|
|---|---|
|彩色图标|![](../../../image/Identity-Authentication-Service/Application-Management/color.png)|
|白色图标|![](../../../image/Identity-Authentication-Service/Application-Management/white.png)|
|红色图标|![](../../../image/Identity-Authentication-Service/Application-Management/red.png)|

<h3 id="2">获取用户的授权码</h3>

HTTPS请求地址：https://oauth2.jdcloud.com/authorize </br>
请求方式：GET/POST </br>
参数：</br>
|参数名|参数选项|参数值|
|---|---|---|
|client_id|必填|创建应用成功返回的客户端ID//////|
|redirect_uri|必填|创建应用时填写的redirect_uri//////|



<h3 id="3">获取用户的访问令牌</h3>

<h3 id="4">获取用户的京东云账号</h3>

<h3 id="5">刷新访问令牌</h3>

<h3 id="6">撤销令牌</h3>

