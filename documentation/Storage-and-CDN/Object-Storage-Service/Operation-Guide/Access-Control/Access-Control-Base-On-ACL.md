# 基于读写权限ACL的权限控制
OSS 为权限控制提供访问控制列表（ACL）。ACL是授予Bucket访问权限的访问策略。
您可以在控制台中创建Bucket时配置ACL，也可以在创建Bucket后的任意时间内修改ACL。若您创建Bucket时未指定则默认权限为私有读写。
# Bucket ACL
Bucket ACL是Bucket级别的权限访问控制。目前支持三种访问权限：public-read-write，public-read 和 private，含义如下：

|权限值|中文名称|权限对访问者的限制|
|:--|:---|:--------|
|public-read-write|公有读写|任何人（包括匿名访问）都可以对该 Bucket 中的 Object 进行读/写/删除操作；所有这些操作产生的费用由该 Bucket 的 Owner 承担，请慎用该权限。|
|public-read|公有读私有写|只有该 Bucket 的 Owner 或者授权用户可以对存放在其中的 Object 进行写/删除操作；任何人（包括匿名访问）可以对 Object 进行读操作。|
|private|私有读写|只有该 Bucket 的Owner 或者授权用户可以对存放在其中的 Object 进行读/写/删除操作；其他人在未经授权的情况下无法访问该 Bucket 内的 Object。|

Bucket ACL的权限设定和读取方法如下：

-   控制台：[创建 Bucket时设置ACL](https://docs.jdcloud.com/cn/object-storage-service/create-bucket-1)、
[修改Bucket ACL](../Manage-Bucket/Set-Bucket-Policy-2.md)

-   API：[PutBucketACL](../../API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bukcet-acl-2.md)、
[GetBucketACL](https://docs.jdcloud.com/cn/object-storage-service/get-bucket-acl-2)

