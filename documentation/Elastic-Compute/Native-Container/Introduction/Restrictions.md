# 限制说明

 1. 目前在华北-北京、华东-上海、华南-广州上线。
 2. 目前仅支持基于Linux操作系统的Docker镜像。
 3. 下表是使用容器的相关限制：



|  资源   |  限制   |  例外申请方式   |
| --- | --- | --- |
|  产品类型  | 原生容器实例、Pod| 所有用户|
|  创建原生容器用户身份限制  | 用户需完成实名认证| 无例外|
|  创建原生容器账户金额限制  |创建按配置计费容器，账户余额需大于50元 | [工单](https://ticket.jdcloud.com/myorder/form?cateId=1&questionId=251)  |
|单地域原生容器实例配额     | 5台    |  [工单](https://ticket.jdcloud.com/myorder/form?cateId=1&questionId=251)   |
|单地域云硬盘配额     |  15块   |  [工单](https://ticket.jdcloud.com/myorder/submit?cateId=1&questionId=251)     |
|单地域云硬盘快照配额     | 15个    | [工单](https://ticket.jdcloud.com/myorder/form?cateId=1&questionId=251)    |
| 单VPC安全组限额    |  50个   |  [工单](https://ticket.jdcloud.com/myorder/form?cateId=1&questionId=251)   |
| 单地域公网IP配额    |  10个   |  [工单](https://ticket.jdcloud.com/myorder/form?cateId=1&questionId=251)  |
|原生容器系统盘类型及容量 | 高效云盘：20-100G；SSD云盘：20-100G | 不可修改 |
|数据盘类型及容量     |  高效云盘：20-3000G；SSD云盘：20-1000G   | 不可修改    |
|    单个安全组规则限制 |  出站与入站规则总和不超过100条   |  不可修改    |
|  单台原生容器可挂载的云硬盘数量   |  8块   |   不可修改   |
| 单台原生容器可关联的安全组数量    |  5个   |  不可修改    |
|  单台原生容器可绑定的公网IP数量   |  1个   | 不可修改    |
|  原生容器日志最大保存容量   |   10M  |  不可修改   |
| 原生容器日志最大输出字节数    |   4k  |   不可修改  |
|原生容器镜像使用限制     | 仅支持基于Linux操作系统的Docker镜像    |不可修改 |

