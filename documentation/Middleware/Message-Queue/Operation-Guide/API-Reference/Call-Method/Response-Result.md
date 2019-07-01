# 返回结果

调用 API 服务后，返回的HTTP状态码为2xx，代表调用成功；返回 4xx 或5xx的HTTP状态码代表调用失败。

### Http Response Status Code

| HTTP状态码 | 错误状态码              | message                                             | 描述            | 建议                    |
| ---------- | ----------------------- | --------------------------------------------------- | --------------- | ----------------------- |
| **400**    | INVALID_ARGUMENT        | Invalid request parameters：[ error parameter name] | 参数校验失败    | 建议检查提示错误的参数  |
| **400**    | ACK_FAILED              | ACK_FAILED                                          | ack失败         |                         |
| **400**    | TOPIC_NOT_EXIST         | TOPIC_NOT_EXIST                                     | topic不存在     | 建议检查topic是否存在   |
| **400**    | INVALID_ARGUMENT        | INVALID_ARGUMENT                                    | 参数无效        | 建议检查参数            |
| **403**    | PERMISSION_DENIED       | Authentication failure                              | 认证失败        | 建议检查accesskey及签名 |
| **403**    | USER_AUTH_FAILED        | USER_AUTH_FAILED                                    | 认证失败        | 建议检查用户权限        |
| **403**    | TOPIC_AUTH_FAILED       | TOPIC_AUTH_FAILED                                   | topic认证失败   | 建议检查topic权限       |
| **403**    | TOPIC_PERMISSION_DENIED | TOPIC_PERMISSION_DENIED                             | 无操作topic权限 | 建议检查topic权限       |
| **408**    | SYNC_TIMEOUT            | SYNC_TIMEOUT                                        | 操作超时        | 建议稍后重试            |
| **429**    | RATE_LIMIT              |                                                     | tps超过限制     | 建议控制访问tps         |
| **429**    | ABNORMAL_ACCESS_RATE    | ABNORMAL_ACCESS_RATE                                | tps超过限制     | 建议控制访问tps         |
| **429**    | THROUGHPUT_UP_TO_LIMIT  | THROUGHPUT_UP_TO_LIMIT                              | tps超过限制     | 建议控制访问tps         |
| **500**    | INTERNAL                |                                                     | 内部错误        |                         |
