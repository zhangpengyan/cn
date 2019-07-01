# 密钥管理服务


## 简介
基于硬件保护密钥的安全数据托管服务


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**cancelKeyDeletion**|PATCH|取消删除密钥|
|**cancelKeyVersionDeletion**|PATCH|取消删除指定版本密钥|
|**createKey**|POST|创建一个CMK（用户主密钥），默认为启用状态|
|**createSecret**|POST|创建机密|
|**createSecretVersion**|POST|创建机密新的版本，默认为已启用状态|
|**decrypt**|POST|使用密钥对数据进行解密|
|**deleteSecret**|DELETE|删除机密|
|**deleteSecretVersion**|DELETE|删除指定版本机密|
|**describeKey**|GET|获取密钥详情|
|**describeKeyDetail**|GET|获取版本详情|
|**describeKeyList**|GET|获取密钥列表|
|**describeSecretList**|GET|获取机密列表|
|**describeSecretVersionInfo**|GET|获取指定机密版本的详细信息|
|**describeSecretVersionList**|GET|获取机密详情|
|**disableKey**|PATCH|禁用当前状态为`已启用`的密钥|
|**disableKeyVersion**|PATCH|禁用指定版本密钥|
|**disableSecret**|PATCH|禁用机密|
|**disableSecretVersion**|PATCH|禁用指定版本机密|
|**enableKey**|PATCH|启用当前状态为`已禁用`的密钥|
|**enableKeyVersion**|PATCH|启用指定版本密钥|
|**enableSecret**|PATCH|启用机密|
|**enableSecretVersion**|PATCH|启用指定版本机密|
|**encrypt**|POST|使用密钥对数据进行加密|
|**exportSecret**|GET|导出机密|
|**generateDataKey**|GET|从KMS中获取一对数据密钥的明文/密文|
|**importSecret**|POST|导入机密|
|**keyRotation**|PATCH|立即轮换密钥，自动轮换周期顺延|
|**scheduleKeyDeletion**|DELETE|计划在以后的是个时间点删除密钥，默认为7天|
|**scheduleKeyVersionDeletion**|DELETE|计划在以后的是个时间点删除指定版本密钥，默认为7天|
|**updateKeyDescription**|PATCH|修改密钥配置，包括key的名称、用途、是否自动轮换和轮换周期等|
|**updateSecret**|PATCH|修改机密描述|
|**updateSecretVersion**|PATCH|修改机密指定版本配置|
