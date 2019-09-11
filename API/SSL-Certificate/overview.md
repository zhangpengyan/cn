# JDCLOUD SSL数字证书管理 API


## 简介
提供SSL数字证书，证书申购记录管理相关信息接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**describeCerts**|GET|查看证书列表|
|**describeCert**|GET|查看证书详情|
|**uploadCert**|POST|上传证书|
|**downloadCert**|GET|下载证书<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
|**deleteCerts**|DELETE|删除证书<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
