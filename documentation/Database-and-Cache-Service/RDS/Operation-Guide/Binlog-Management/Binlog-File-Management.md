# Binlog 文件查看
Binlog 文件记录实例的事务信息，是云数据库 MySQL/Percona/MariaDB 实例 HA 架构以及高可用性、可恢复性的基础。
云数据库 MySQL/Percona/MariaDB 实例会定期自动同步 Binlog 文件至云存储，并在6小时后清理本地 Binlog 文件，届时可以释放实例本地的存储空间供其他用途使用。

## 注意事项
* 目前京东云暂不收取 Binlog 所产生的空间占用费用。

## 查看已经上传云存储的 Binlog 文件
1. 进入 [云数据库 RDS 控制台](https://rds-console.jdcloud.com/database)。
2. 选择需要查看 Binlog 的目标实例，点击目标实例的名称，进入到实例详情页。
3. 选择 ***备份管理*** 标签，点击 ***Binlog*** 标签进入 Binlog 的列表页，就能看到已经上传到云存储的 Binlog 文件。
