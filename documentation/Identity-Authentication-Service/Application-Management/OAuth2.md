# 京东云OAuth2接入指引
## 一. 什么是京东云OAuth2
**OAuth2**（开放授权）是一个开放的标准授权协议，允许用户授权第三方应用访问该用户存储在服务商处的私密资源。用户无需向第三方应用共享自己在服务商处的用户名和密码，而是提供给第三方应用一个令牌，第三方应用即可使用该令牌来访问服务商处的用户资源。每一个令牌只能授权给一个特定的应用在特定的时间段内访问特定的资源，因此第三方应用无法访问未经用户授权的资源。</br>
OAuth2的更多说明，请参考其[官方网站](https://oauth.net/2/)。</br>

**京东云OAuth2**采用OAuth2协议来实现用户的身份验证和授权，在用户授权的基础上支持第三方应用获取用户身份，以及通过京东云OpenAPI访问用户在京东云的资源。</br>

## 二. 接入京东云OAuth2
京东云OAuth2支持网站或Web应用接入，接入流程如下：</br>
1. [创建应用](../../../documentation/Identity-Authentication-Service/Application-Management/Create-Application.md)，获取client_id；</br>
2. 根据[京东云OAuth2协议](#0)，开发应用：</br>
&emsp;2.1 在应用中[放置京东云登录按钮](#1)</br>
&emsp;2.2 [获取用户的授权码](#2)</br>
&emsp;2.3 [获取用户的访问令牌](#3)</br>
&emsp;2.4 [获取用户的京东云账号](#4)</br>
&emsp;2.5 如有必要，[刷新访问令牌](#5)</br>
&emsp;2.6 如有必要，[撤销令牌](#6)</br>

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
- (D) 应用收到授权码，用授权码向京东云申请令牌；</br>
- (E) 京东云核对应用信息无误，向应用颁发用户的访问令牌；如果应用启用了刷新令牌，则京东云会同时返回刷新令牌。</br>

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
|response_type|必填|String|值为'code'，代表需要京东云返回授权码|
|state|必填|String|任意字符串，用于防止跨站请求伪造（[了解更多](https://tools.ietf.org/html/rfc6749#section-10.12)）|
|scope|选填</br>应用已向京东云申请访问范围时，可选填；填写未申请的访问范围会报错|String|值为'openid'</br>如果scope='openid'，且用户同意授权应用获取其身份信息，则在下一步骤令牌端点中，京东云将返回用户的OpenID信息（JWT格式的id_token）|
|code_challenge_method|选填</br>应用如果已设置密码不需要填，应用未设置密码时建议填写|String|代码质询方法，值为'plain'或'S256'|
|code_challenge|选填</br>和code_challenge_method参数一起填写|String|长度为43-128的字符串，用于在后续令牌端点的请求中验证应用身份|

响应结果：</br>
(1) 浏览器HTTP 302重定向到京东云登录授权页面，用户进行登录和授权操作</br>
(2) 用户登录授权成功，浏览器HTTP 302重定向回到应用回调地址，并返回授权码：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|code|必填|String|8位长度的授权码|
|state|必填|String|和请求参数state一致|

请求示例：</br>
```
https://oauth2.jdcloud.com/authorize?client_id=9145611234658436&redirect_uri=https://www.redirect.com/abc&response_type=code&state=mn3N7e85WH&code_challenge_method=S256&code_challenge=Vuu-tYpwl_4xB8miLyRO2p__zQoADgG1A40LoYCYsgU
```
浏览器将重定向到京东云登录页：</br>
```
https://uc.jdcloud.com/login?returnUrl=http%3A%2F%2Foauth2.jdcloud.com%2Fauthorize%3Fclient_id%3D9145611234658436%26redirect_uri%3Dhttps%3A%2F%2Fwww.redirect.com%2Fabc%26response_type%3Dcode%26state%3Dmn3N7e85WH%26code_challenge_method%3DS256%26code_challenge%3DVuu-tYpwl_4xB8miLyRO2p__zQoADgG1A40LoYCYsgU
```
用户登录并授权后，浏览器将重定向到应用提供的回调地址：</br>
```
https://www.redirect.com/abc?code=7Y6m65jY&state=mn3N7e85WH
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
|client_id|选填</br>客户端密码验证方式不是“HTTP Basic”时必填|String|应用ID|
|client_secret|选填</br>客户端密码验证方式为“通过请求参数验证”时必填|String|创建应用时填写的客户端密码|
|grant_type|必填|String|值必须为'authorization_code'|
|code|必填|String|在授权码端点响应中返回的code值|
|code_verifier|选填</br>在授权码端点中传过code_challenge时必须|String|应用验证代码</br>- 如果在授权码端点中，code_challenge_method=plain，则code_verifier=code_challenge</br>- 如果在授权码端点中，code_challenge_method=S256，则BASE64URL(SHA256(ascii(code_verifier)))=code_challenge</br>（查看[code_verifier编码示例](#7)）|

响应结果：</br>
JSON格式的访问令牌：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|access_token|必填|String|访问令牌|
|refresh_token|选填|String|刷新令牌</br>如果创建应用时启用了刷新令牌则返回该值，否则不返回|
|id_token|选填|String|在授权端点中请求了scope='openid'，则会返回JWT格式的id_token|
|token_type|必填|String|访问令牌类型，值为"Bearer"|
|expires_in|必填|String|访问令牌有效期，单位为秒|

请求示例：</br>
```
https://oauth2.jdcloud.com/token?client_id=9251547552808156&client_secret=HXue9usjI>0&grant_type=authorization_code&code=bX8ThG8l
```
响应示例：</br>
```
{
"access_token":"5ECTSzkTOgpHkJWFOA7yhfH3niyH1ZME",
"refresh_token":"4SixsR5H8WxK8QrB",
"id_token":"eyJraWQiOiJmNzExOWVmNS1lN2QxLTRkZGUtOWNjNi1jM2NhY2NjMGJlMTMiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwOi8vb2F1dGgyLXN0YWcuamRjbG91ZC5jb20iLCJhdWQiOiI5NTExNTQwMjYwNTg0OTMwIiwic3ViIjoi5Lia5Yqh56CU5Y-RSmRjbG91ZF8wMiIsImlhdCI6MTU0MDUzNDg1NCwibmJmIjoxNTQwNTM0ODU0LCJleHAiOjE1NDA1MzU4NTQsImp0aSI6ImQ2ODNhZDg5LTVhMmYtNDg2My1hNjViLTQzZDZmMWNiOTUxNiIsImF0X2hhc2giOiJxQkp2TTFCUGFpTkNtbHBvIn0.ShJQQK0Ox6RPrQh7vzMAjvDia6tpDCQz-vu865aAtSPISlRxZiib7UebwgQ7sypuYiMm1UQuq6MCLJGkrm8sgN1wrUnMSWfUJK0pKHarvwvTA3xj1Cah6awwzCSXgHI71wSociOELpZmRWafvvM_IE72M9yqRXOeW97jkx4caGBnH2WTZD6H37Xux5gySijw8FVUvo47biOaw_fIA6QSB0HeE4e8Ikg-tCpPXv1RmsWvr_KC_YapRh624ScclXa1xSthVcroFalE5YkjkYItiOLNMpVzbE3vnuFaeZsYVgEwNgL7ICZ8rTHl41xlhPcHyGAH55rA5MmX_B92IPj3Fw",
"scope":"openid",
"token_type":"Bearer",
"expires_in":999
}
```

<h3 id="4">获取用户的京东云账号</h3>

**用户信息端点说明**</br>
HTTPS请求地址：https://oauth2.jdcloud.com/userinfo </br>
请求方式：GET/POST </br>
在**请求头**中包含访问令牌：</br>
`Authorization:Bearer access_token`</br>

参数：</br>
无需请求参数

响应结果：</br>
JSON格式的用户信息：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|account|必填|String|用户在京东云的唯一账号|
|name|必填|String|用户名或显示名</br>当type='root'时，用户名=account；当type='sub'时，用户名!=account|
|type|必填|String|用户类型</br>'root'为京东云租户的主账号，'sub'为租户下子用户账号|

请求示例：</br>
```
https://oauth2.jdcloud.com/userinfo
(header)
Authorization:Bearer VFNm5WsCop72A4xIqMctpgJgXjG5JMjm
```
响应示例：</br>
```
{
"name": "jdcloud001",
"account": "jdcloud001",
"type": "root"
}
```

<h3 id="5">刷新访问令牌</h3>

**令牌端点说明**</br>
HTTPS请求地址：https://oauth2.jdcloud.com/token </br>
请求方式：GET/POST </br>
如果在创建应用时，选择“**HTTP基本验证方式**”为客户端密码验证方式，则必须在**请求头**中包含如下值：</br>
`Authorization:Basic base64url(client_id:client_secret)`</br>

参数：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|client_id|选填</br>客户端密码验证方式不是“HTTP Basic”时必填|String|应用ID|
|client_secret|选填</br>客户端密码验证方式为“通过请求参数验证”时必填|String|创建应用时填写的客户端密码|
|grant_type|必填|String|值必须为'refresh_token'|
|refresh_token|必填|String|刷新令牌|

响应结果：</br>
JSON格式的访问令牌：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|access_token|必填|String|访问令牌|
|token_type|必填|String|访问令牌类型，值为"Bearer"|
|expires_in|必填|String|访问令牌有效期，单位为秒|

请求示例：</br>
```
https://oauth2.jdcloud.com/token?client_id=9251547552808156&client_secret=HXue9usjI>0&grant_type=refresh_token&refresh_token=F2JxdUHwn4YDnJYu	
```
响应示例：</br>
```
{
"access_token":"50px73X5683kQrTnQ8TU12GXB0BlBDBV",
"token_type":"Bearer",
"expires_in":999,
}
```

<h3 id="6">撤销令牌</h3>

**撤销令牌端点说明**</br>
HTTPS请求地址：https://oauth2.jdcloud.com/revoke </br>
请求方式：GET/POST </br>
如果在创建应用时，选择“**HTTP基本验证方式**”为客户端密码验证方式，则必须在**请求头**中包含如下值：</br>
`Authorization:Basic base64url(client_id:client_secret)`</br>

参数：</br>

|参数名|参数选项|参数格式|参数值|
|---|---|---|---|
|client_id|选填</br>客户端密码验证方式不是“HTTP Basic”时必填|String|应用ID|
|client_secret|选填</br>客户端密码验证方式为“通过请求参数验证”时必填|String|创建应用时填写的客户端密码|
|token_type_hint|选填|String|要撤销的令牌类型，默认值为'access_token'</br>token_type_hint='access_token'撤销访问令牌；</br>token_type_hint='refresh_token'撤销刷新令牌|
|token|必填|String|令牌的值|

响应结果：</br>
HTTP 200</br>

请求示例：</br>
```
https://oauth2.jdcloud.com/revoke?client_id=9145611234658436&client_secret=HXue9usjI>0&token=Zyph3XFeoDNc6AQUTLftykHjo8KM8fuN
https://oauth2.jdcloud.com/revoke?client_id=9145611234658436&client_secret=HXue9usjI>0&token=EKQtH8pyxxAyvhRX&token_type_hint=refresh_token
```

<h3 id="7">code_verifier编码详情</h3>

