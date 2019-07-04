# OSS访问域名和地域 

Region表示OSS的数据中心所在的地域，Endpoint表示OSS对外服务的访问域名（服务域名）。

本文主要介绍Region与Endpoint的对应关系。

## OSS支持Region和Endpoint对照表 

各地域Endpoint的内外网配置如下：

|Region中文名称|Region英文表示|外网Endpoint|外网支持HTTPS|内网Endpoint|内网支持HTTPS|
|:---------|:---------|:---------|:--------|:---------------|:--------|
|华北-北京|cn-north-1|s3.cn-north-1.jdcloud-oss.com|是|s3-internal.cn-north-1.jdcloud-oss.com|是|
|华南-广州|cn-south-1|s3.cn-south-1.jdcloud-oss.com|是|s3-internal.cn-south-1.jdcloud-oss.com|是|
|华东-上海|cn-east-2|s3.cn-east-2.jdcloud-oss.com|是|s3-internal.cn-east-2.jdcloud-oss.com|是|
|华东-宿迁 |cn-east-1|s3.cn-east-1.jdcloud-oss.com|是|s3-internal.cn-east-1.jdcloud-oss.com|是|

**说明：** 

-   在分享文件的链接或者做自定义域名绑定（CNAME）的时候建议使用三级域名，即`Bucket` + `Endpoint`的形式。以地域华北-北京内名为oss-sample的Bucket为例，
    三级域名为oss-sample.s3.cn-north-1.jdcloud-oss.com。
-   使用SDK时，请将 `http://` 或 `https://` + `Endpoint` 作为初始化的参数。以华南-广州的Endpoint为例，建议将初始化参数设置为
`http://s3.cn-south-1.jdcloud-oss.com` 或者 `https://s3.cn-south-1.jdcloud-oss.com`，不建议将三级域名
 （即`https://bucket.s3.cn-south-1.jdcloud-oss.com`）作为初始化参数。
-   区分内外访问域名例如：s3.cn-south-1.jdcloud-oss.com 指向华南-广州地域的外网访问地址。内网访问地址s3-internal.cn-south-1.jdcloud-oss.com 指向华南-广州地域内网地址，在京东云VPC中使用OSS 建议使用内网访问域名，上传与下载流量均免费。
- OSS 旧版访问域名 `oss.<Region>.jcloudcs.com`与`s3.<Region>.jcloudcs.com` 会依旧提供服务，但是不推荐使用。
