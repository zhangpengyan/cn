# Bucket Policy最佳实践

由于京东云对象存储的空间权限管理功能升级，为确保不影响您的业务使用及对新版权限功能即Bucket Policy的理解，本文档将给出相关说明。

在Bucket Policy功能上线后，原有的Bucket ACL将从只有“私有读写”和“公有读私有写”扩展为支持“私有读写”、“公有读私有写”、“公有读写”和“自定义权限”，其中“自定义权限”作为Bucket的高级权限设置，您可以在自定义权限中对用户(包括主用户与子用户)和资源进行授权管理；

在此次功能升级之后，控制台中原有的防盗链Referer设置必须在“自定义权限”的Bucket Policy中进行设置，具体内容可参考下图：

![Policy](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-074.png)

为保障已经设置了Bucket ACL和防盗链Referer的Bucket在上线前后系统行为一致（规则语义不变），若您之前设置了防盗链Referer，则对权限策略进行平滑迁移，各种情况下的鉴权逻辑如下：

|原Bucket ACL|原Referer规则|Bucket Policy上线后处理方式|规则说明|
|-|-|-|-|
|公有读私有写|允许Referer为空<br>白名单中未添加任何Referer|系统为您自动添加一条Policy，格式为：Statement: [ {"Action":["s3:GetObject"], "Effect":"Allow", "Principal":"*", "Condition":{"StringLike":{"aws:Referer":[""]}} } ]|语义为只允许空Referer的请求访问|
|公有读私有写|允许Referer为空<br>白名单中添加了某条或某些Referer<br>如www.test.com|系统为您自动添加一条Policy，格式为：Statement:[ {"Action":["s3:GetObject"], "Effect":"Allow", "Principal":"*", "Condition":{"StringLike":{"aws:Referer":["", "www.test.com"]}} } ]|语义为允许空Referer或命中白名单中指定Referer的请求访问|
|公有读私有写|不允许Referer为空<br>白名单中未添加任何Referer|系统不会为您添加任何Policy规则|该Bucket的权限将置为系统默认权限，即Private，语义为全部请求默认拒绝|
|公有读私有写|不允许Referer为空<br>白名单中添加了某条或某些Referer<br>如www.test.com|系统为您自动添加一条Policy，格式为：{"Action":["s3:GetObject"], "Effect":"Allow", "Principal":"*", "Condition":{"StringLike":{"aws:Referer":["www.test.com"]}} }]|语义为只允许命中白名单中指定Referer的请求访问|
|公有读私有写|允许Referer为空<br>黑名单中添加了某条或某些Referer<br>如www.test.com|系统为您自动添加一条Policy，格式为{"Action":"s3:GetObject", "Effect":"Allow", "Principal": "*", "Condition": { "NotStringLike": {"Referer": "www.test.com"}}}|语义为拒绝来自某个Refer的请求|
|私有读写|由于原版防盗链规则只对公有读私有写的存储空间生效，所以此处可以忽略原规则|系统不会为您添加任何Policy规则|该Bucket的权限将置为系统默认权限，即Private，语义为全部请求默认拒绝|

目前所有的权限都设置在Bucket级别，我们可以对每个Bucket设置多条规则(Statement)，每条规则会对一个请求产生Allow，Deny两种结果，每个Policy可以有多个规则(Statement)，一个Policy下最多允许有10个Statements，Bucket Policy示例及语义解释：
```
{
    "Statement":[
        {
            "Condition":{
                "StringLike":{
                    "aws:Referer":[
                        "",
                        "www.abc.com",
                        "*.123.com"
                    ]
                }
            },
            "Resource":[
                "arn:aws:s3:::ztctest1/*"
            ],
            "Action":[
                "s3:GetObject"
            ],
            "Principal":{
                "AWS":"*"
            },
            "Sid":"Refereracl",
            "Effect":"Allow"
        }
    ],
    "Id":"referer-acl",
    "Version":"2012-10-17"
}
```

细节说明：

Version：可选填字段，Version作为Policy版本号，无具体格式和内容限制，示例中是以时间作为版本标识

Id：可选填字段，用Id作为Policy的标识，无具体格式和内容限制

Statement：必填字段，为Policy中的主体内容，其中各子项释义为：

|元素|含义|必填|
|-|-|-|
|Sid|该规则的注释字符串|否|
|Effect|匹配该规则时产生的效果，可选值为Allow或Deny，释义为"允许操作"或"拒绝操作"|是|
|Principal|为该Policy影响所到的用户，需要填入用户ID，默认值为*，即对全部用户生效|是|
|Action|该规则中生效的操作，可选值为s3:GetObject、s3:PutObject、s3:DeleteObject、s3:ListBucket、s3:DeleteBucket|是|
|Resource|为影响的资源名称或资源范围，格式为arn:aws:s3::examplebucket/*，语义为对examplebucket下的全部资源有效|是|
|Condition|规则生效的条件，目前支持Referer和SourceIP|否|

上例中的语义最终解释为：对全部用户，允许命中白名单中指定Referer（即www.example.com）的请求访问该Bucket下的全部资源
