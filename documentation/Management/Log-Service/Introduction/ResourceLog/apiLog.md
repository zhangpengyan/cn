## API网关日志
### 简介
目前接入日志服务的API网关日志类型为**API调用日志**。

### 字段说明
日志字段 | 字段描述 | 字段类型
-- | -- | --
version | 请求版本号： 永远为 "1" | string
req_id | 请求request id： 对于同一个服务，每个请求唯一（同一条请求链，可以共享REQID，或者共享 REQID 前缀) | string
time | nginx的$msec输出，格式为1525259222.686 | string
ip | 请求IP： 格式为 "1.2.3.123" | string
pin | 格式为"userName", 为京东商城账号base64格式,调用者pin | string
host | 请求HOST地址： 格式为 "xi6d7nci0239.cn-north-1.jdcloud-api.net" | string
method | 请求HTTP方法： 格式为 "GET", "POST" 等，使用大写 | string
SCHEME | 请求scheme：格式为 "http", "https" 等，使用小写 | string
path | 请求HTTP PATH： 格式为 "GET /hello?a=1&b=2 HTTP/1.1"，两侧不加引号 | string
request_content_length | 请求内容长度： 格式为 "123456" | string
response_status | 响应状态码： 格式为 "200", "400" , "500" , "502" |string
response_content_type | 响应格式： 格式为 "application/json" | string
response_content_length | 响应内容长度： 格式为 "123456" ，注意只是body 部分，跟HEADER无关 | string
reponse_time | 响应时间： "0.123", 单位为秒，精度到毫秒 | string
x_forwarded_for | X-Forwarded-For:简称XFF头，客户端HTTP的请求端真实的IP： 格式为 "12.34.56.78", 可以为 "-" | string
referer | 请求来源： 格式为 "http://www.baidu.com", 如果没有，用 "-" 表示 | string
user_agent | 请求客户端代理： 格式例如"JdcloudSdkPython/1.0.0 vm/0.6.1" | string
upstream_response_time | 产品线处理时长，"0.123", 单位为秒，精度到微秒 | string
call_log | 依赖服务处理时长，格式为 "UC:5,FUNC:0" 等 | string
uuid | 调用方传的uuid | string
upstream_host | 上游地址 | string
code_source | 状态码响应源，格式为“upstream” 或 “gw” | string
service_prod | 环境的标识,格式为“apim” | string
group_id | api标识，包含环境信息，格式为ag-xi6d7nci0239-online,其中online表示环境信息 | string
group_name | 分组名称，格式， 只支持数字、大小写字母、英文下划线“_”及中划线“-”且不能超过32字符 | string
api_name | api名称，格式， 只支持数字、大小写字母、英文下划线“_”及中划线“-”且不能超过32字符 | string
api_version | api版本，格式如0.0.1 | string
proxy_time | 网关耗时： "0.123", 单位为秒，精度到毫秒 | string
creater_pin | 格式为"userName", 为京东商城账号base64格式,创建者pin | string
