## MySQL日志
### 简介
目前接入日志服务的MySQL日志类型为**审计日志**。MySQL审计日志检索跨度最多支持7天。

### 字段说明
日志字段 | 字段描述 | 字段类型
-- | -- | --
customTimeStr | 日志记录时间 | string
user_name | 访问用户名称 | string
user_ip | 用户客户端ip地址 | string
resourceId | MySQL实例same id | string
operation | 请求类型 | string
db | 请求访问数据库名称 | string
g_id | MySQL集群gid | string
sql | 请求的具体SQL | string
