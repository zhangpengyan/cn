# 透明数据库加密 TDE 支持

## TDE 简介

京东云数据库 RDS 支持使用透明数据加密 (TDE) 来加密运行 Microsoft SQL Server 的数据库实例中存储的数据。TDE 会在数据写入存储前自动加密这些数据，并在从存储中读取时自动解密这些数据。数据库文件的加密在页级别执行， 已加密数据库中的页在写入磁盘之前会进行加密，在读入内存时会进行解密。 TDE 不会增加已加密数据库的大小。

关于透明数据加密TDE的详细介绍可参考微软的文档 [透明数据加密](https://docs.microsoft.com/zh-cn/sql/relational-databases/security/encryption/transparent-data-encryption?view=sql-server-2017)

京东云数据库 RDS 支持在以下 SQL Server 版本中使用 TDE：

- SQL Server 2008R2 企业版
- SQL Server 2012 企业版
- SQL Server 2014 企业版
- SQL Server 2016 企业版

## 注意事项
1. TDE在实例级别开启后不允许关闭
2. 用户可在开启TDE后，通过SQL启用（或关闭）要加密的数据库
3. 开启TDE后，会增加显著CPU的的负荷，建议在测试后开启。以下是第三方的对TDE的性能测试对比，供参考, [TDE Performance Comparision](https://www.mssqltips.com/sqlservertip/2641/sql-server-transparent-data-encryption-tde-performance-comparison/?spm=5176.11156381.0.0.37b6706fyHyVsK)
4. 如果数据库实例上拥有至少一个加密的数据库，那么也可能会降低未加密数据库的性能。因此，建议您加密数据库和未加密数据库保存在不同的数据库实例上。

## 限制
- 加密的数据库的备份无法通过“跨实例恢复”功能恢复到其他实例上
- 加密的数据库备份下载后，需要解密后才能恢复到本地的数据库。 解密的密钥请联系客户获取，后续会提供自助下载功能。
- 加密的数据库暂不支持跨域备份备份同步

## 操作步骤
1. 登录RDS控制台，点击实例，进入到 **“安全管理”** 页面
2. 选择 **“TDE透明数据加密”** ，点击开关，开启实例级别的TDE
3. 对要开启TDE的数据库，执行以下SQL。 以数据库db1为例
```SQL
USE master
GO
SELECT name FROM sys.certificates WHERE name LIKE 'TDE%'
GO

-- TDECertificateName 为上一步查询出的TDE证书名称
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM=AES_128
ENCRYPTION BY SERVER CERTIFICATE [TDECertificateName]
GO

ALTER DATABASE db1
SET ENCRYPTION ON
GO

-- 验证TDE已开启
USE master
GO
SELECT name FROM sys.databases WHERE is_encrypted = 1
GO
SELECT db_name(database_id) as DatabaseName, * FROM sys.dm_database_encryption_keys
GO 
```



