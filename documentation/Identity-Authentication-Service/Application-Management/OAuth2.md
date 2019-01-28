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

- (A) 用户通过浏览器访问应用，应用向京东云授权服务器发起登录请求（提供应用ID、应用的回调地址、需要访问用户哪些资源），同时浏览器重定向到京东云登录页面；</br>
- (B) 用户登录京东云，京东云验证用户身份（通过是否成功登录），并询问用户是否同意授权应用访问自己的资源；</br>
- (C) 如果用户同意授权，京东云将浏览器重定向回应用指定的回调地址，同时附上一个授权码；</br>
- (D) 应用收到授权码，用授权码向京东云申请令牌（同时再次提供它的回调地址）;</br>
- (E) 京东云核对应用信息无误，向应用颁发用户的访问令牌和刷新令牌。</br>

通过上述流程，应用获得了用户的访问令牌。应用是否能凭借访问令牌访问用户的京东云资源，取决于用户在(B)步骤中是否同意授权。</br>

<h3 id="1">放置京东云登录按钮</h3>

京东云提供了几种标准图标供应用开发者[下载](../../../image/Identity-Authentication-Service/Application-Management/download-resource/jdcloud-icon.zip)。放置京东云登录按钮请参考下述标示。</br>

|图标|标示|
|---|---|
|彩色图标|![](../../../image/Identity-Authentication-Service/Application-Management/color.png)|

<h3 id="2">获取用户的授权码</h3>

**授权码端点说明**</br>
HTTPS请求地址：https://oauth2.jdcloud.com/authorize </br>
请求方式：GET/POST </br>
参数：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|client_id|必填|String|应用ID|
|redirect_uri|必填|String|必须和创建应用时填写的应用回调地址一样|
|response_type|必填|String|值必须为'code'，代表需要京东云返回授权码|
|state|必填|String|任意字符串，用于防止跨站请求伪造（[了解更多](https://tools.ietf.org/html/rfc6749#section-10.12)）|
|scope|选填|String|空格分隔的字符串，列举应用需要的[令牌访问范围](#7)，必须在创建应用时已注册|
|code_challenge_method|选填；应用未设置密码时必填|String|代码质询方法，值为'plain'或'S256'|
|code_challenge|选填；应用未设置密码时必填|String|长度为43-128的字符串，用于验证应用的后续请求|

响应结果：</br>
(1) 浏览器HTTP 302重定向到京东云登录授权页面，用户进行登录和授权操作</br>
(2) 用户登录授权成功，浏览器HTTP 302重定向回到应用回调地址，并返回授权码：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|code|必填|String|8位长度的授权码|
|state|必填|String|和请求参数state一致|

请求示例：</br>
```
https://oauth2.jdcloud.com/authorize?client_id=9145611234658436&redirect_uri=https://www.redirect.com/abc&response_type=code&state=J83xoLA0&scope=openid&code_challenge_method=S256&code_challenge=Vuu-tYpwl_4xB8miLyRO2p__zQoADgG1A40LoYCYsgU
```
浏览器将重定向到京东云登录页：</br>
```
https://uc.jdcloud.com/login?returnUrl=http%3A%2F%2Foauth2.jdcloud.com%2Fauthorize%3Fclient_id%3D9145611234658436%26redirect_uri%3Dhttps%3A%2F%2Fwww.redirect.com%2Fabc%26response_type%3Dcode%26state%3DJ83xoLA0%26scope%3Dopenid%26code_challenge_method%3DS256%26code_challenge%3DVuu-tYpwl_4xB8miLyRO2p__zQoADgG1A40LoYCYsgU
```
用户登录并授权后，浏览器将重定向到应用提供的回调地址：</br>
```
http://www.redirect.com/abc?code=7Y6m65jY&state=J83xoLA0
```

<h3 id="3">获取用户的访问令牌</h3>

**令牌端点说明**</br>
HTTPS请求地址：https://oauth2.jdcloud.com/token </br>
请求方式：GET/POST </br>
如果在创建应用时，选择“**HTTP基本验证方式**”为客户端密码验证方式，则必须在**请求头**中包含如下值：</br>
`Authorization:Basic base64url(client_id:client_secret)`</br>

参数：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|client_id|选填；客户端密码验证方式不是“HTTP Basic”时必填|String|应用ID|
|client_secret|选填；客户端密码验证方式为“通过请求参数验证”时必填|String|创建应用时填写的客户端密码|
|grant_type|必填|String|值必须为'authorization_code'|
|code|必填|String|在授权码端点响应中返回的code值|
|code_verifier|选填；在授权码端点中传过code_challenge时必须|String|如果在授权码端点中，code_challenge_method=plain，则code_verifier=code_challenge</br>如果在授权码端点中，code_challenge_method=S256，则BASE64URL(SHA256(ascii(code_verifier)))=code_challenge</br>（查看[code_verifier编码详情](#8)）|

响应结果：</br>
JSON格式的访问令牌：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|access_token|必填|String|访问令牌|
|token_type|必填|String|访问令牌类型，值为"Bearer"|
|expires_in|必填|String|访问令牌有效期，单位为秒|
|scope|选填|String|访问令牌的有效访问范围，如果授权码端点中请求了scope，且用户同意授权，则返回用户同意的scope范围|


请求示例：</br>
```
http://oauth2.jdcloud.com/token?client_id=9251547552808156&client_secret=abcd1234&grant_type=authorization_code&code=bX8ThG8l
```
响应示例：</br>
```
{"access_token":"no4zOmHN2A4VT3TnMbnZXZexXbWssFX3","refresh_token":"F2JxdUHwn4YDnJYu","token_type":"Bearer","expires_in":999,"scope":"openid"}
```

<h3 id="4">获取用户的京东云账号</h3>

<h3 id="5">刷新访问令牌</h3>

<h3 id="6">撤销令牌</h3>

<h3 id="7">令牌访问范围</h3>

<h3 id="8">code_verifier编码详情</h3>

