
# 存储空间

存储空间（Bucket）是存储对象（Object）的容器。

## 存储空间功能操作
* 创建存储空间（bucket）：[创建存储空间（bucket）](Bucket-JavaSDK#user-content-1)
* 列出同一地域中Bucket：[列举Bucket ](Bucket-JavaSDK#user-content-2)
* 列举Bucket中文件：[ List Objects](Bucket-JavaSDK#user-content-3)
* 删除Bucket：[ 删除Bucket](Bucket-JavaSDK#user-content-4)

<div id="user-content-1"></div>

## 创建存储空间

```Java
String bucket_name = "<yourBucketName>";
try {
    // 创建存储空间。
    s3.createBucket(bucket_name);
    System.out.format("creat OSS bucket %s...",  bucket_name);
} catch (AmazonServiceException e) {
    // 捕获异常。
    e.printStackTrace();
}
```

<div id="user-content-2"></div>
         

##  列出同一地域中Bucket



```Java
List<Bucket> buckets = s3.listBuckets();
System.out.println("Your jdcloud OSS buckets are:");
for (Bucket a : buckets) {
    System.out.println("* " + a.getName());
}
```

<div id="user-content-3"></div>

##  列举Bucket中文件（List Objects）

```Java
String bucket_name = "<your bucketname>";

System.out.format("Objects in OSS bucket %s:\n", bucket_name);
ListObjectsV2Result result = s3.listObjectsV2(bucket_name);
List<S3ObjectSummary> objects = result.getObjectSummaries();
for (S3ObjectSummary os: objects) {
    System.out.println("* " + os.getKey());
}

```

<div id="user-content-4"></div>

## 删除Bucket

```Java

String bucket_name = "<your bucketname>";

try {
    s3.deleteBucket(bucket_name);
} catch (AmazonServiceException e) {
    System.err.println(e.getErrorMessage());
    System.exit(1);
}

```
