## 函数服务日志
### 简介
目前接入日志服务的函数服务日志类型为**函数执行日志**。

### 字段说明
日志字段 | 字段描述 | 字段类型
-- | -- | --
time | 日志记录时间 | time
request_id | 请求id | string
function_name | 函数名称 | string
version | 函数版本 | string
content | 函数输出 | string
message | 函数错误信息 | string
