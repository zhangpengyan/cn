
# 错误码

### 1. 系统级错误码
返回码 (code)|说明（message）
:---|:---
10000|查询成功
10001|错误的请求appkey
10003|不存在相应的数据信息
10004|URL上appkey参数不能为空
10010|接口需要付费，请充值
10020|系统繁忙，请稍后再试
10030|调用网关失败，请与京东云联系
10040|超过每天限量，请明天继续
10041|URL上timestamp参数不能为空
10042|URL上sign参数不能为空
10043|超过QPS限额，请降低调用频率或与京东云联系
10044|集群QPS超限额，请与京东云联系
10046|timestamp参数格式错误
10047|请求签名sign无效，请检查签名信息
10048|无接口权限，请下单购买
10050|用户已被禁用
10060|发布方设置调用权限，请联系发布方
11010|发布方接口调用异常，请稍后再试
11030|发布方接口返回格式有误

### 2. 业务错误码

|错误码|英文说明|具体说明|
|:--|:--|:--|
|12001|illegal params|参数非法|
|12005|fail to process image|图片处理失败|
|12007|invalid image type, only jpg, jpeg are allowed|无效文件类型，仅支持 jpg,jpeg|
|12009|file too large|图片体积过大，不能超过 2M|
|12010|Internal Error|处理错误|

### 3. 网关系统级错误码
|错误码|HTTP状态码|错误信息|解决方案|
|:--|:--|:--|:--|
|ARGUMENT_NOT_SUPPORT|400|参数 argument 不支持|	请检查访问信息|
|ARGUMENT_NOT_FOUND	|400	|参数 argument 是必填参数	|请检查访问信息|
|ARGUMENT_WRONG_FORMAT	|400	|	参数 argument 类型应该是 某format	|请检查访问信息|
|OUT_OF_RANGE	|400	|	参数取值不合法或超出范围	|请检查访问信息|
|ARGUMENT_MISMATCH	|400	|	资源 resource 不存在参数 argument	|请检查访问信息|
|INVALID_ARGUMENT	|400	|	参数 argument 存在错误	|请检查访问信息|
|FAILED_PRECONDITION	|400	|	资源 resource 在当前状态下不可进行当前操作	|请检查访问信息|
|UNAUTHENTICATED	|401	|	认证失败	|请检查访问信息|
|HTTP_FORBIDDEN	|403	|	认证失败	|请在相关系统或需联系相关管理员开权限|
|RESOURCE_NOT_EXIST	|404	|	资源 resource 不存在	|请检查访问信息|
|NOT_FOUND	|404	|	找不到 resource	|请检查访问信息|
|ABORTED	|409	|	当前无法对 resource 进行操作	|请检查访问信息|
|ALREADY_EXISTS	|409	|	resource 已存在	|请检查访问信息|
|CONFLICT	|409	|	两种资源归属的父资源不一致	|请检查访问信息|
|FAILED_PRECONDITION	|409	|	多个参数有大小依赖关系	|请检查访问信息|
|QUOTA_EXCEEDED	|429	|	配额不足	|请检查访问信息，或增加配额|
|RATE_LIMIT_EXCEEDED	|429	|	请求过频繁	|请稍后重试|
|CANCELLED	|499	|		取消操作	| |
|UNKNOWN	|500	|		未知错误		| 请稍后重试 |
|INTERNAL	|500	|		内部错误		| 请稍后重试 |
|NOT_IMPLEMENTED	|501	|		目前不支持 method		| 请检查访问信息 |
|SOURCE_UNAVAILABLE	|502	|		源站不可用		| 请检查访问信息 |
|UNAVAILABLE	|503	|		服务不可用		| 请检查访问信息 |
|DEADLINE_EXCEEDED	|504	|		超时		| 	请稍后重试 |
