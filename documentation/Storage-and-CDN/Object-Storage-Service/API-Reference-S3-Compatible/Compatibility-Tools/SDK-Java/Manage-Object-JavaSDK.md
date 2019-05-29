# 管理对象

## 删除Object

```Java
String bucket_name = "<your bucketname>";
String key = "<your keyname>";

try {
    s3.deleteObject(bucket_name, key);
} catch (AmazonServiceException e) {
    System.err.println(e.getErrorMessage());
    System.exit(1);
}
```

## 复制\移动\重命名Object

```Java
String from_bucket = "<your source bucketname>";
String to_bucket = "<your destination bucket name>";
String object_key = "<your keyname>";
String object_key1 = "<your keyname>";

try {
    s3.copyObject(from_bucket, object_key, to_bucket, object_key1);
} catch (AmazonServiceException e) {
    System.err.println(e.getErrorMessage());
    System.exit(1);
}
```
注：您可以将 copyObject 与 deleteObject 配合使用来移动或重命名Object，方式是先将Object复制到新名称 (您可以使用与源和目标相同的Bucket)，然后从旧位置删除Obcjet。

## 批量删除Objects

```Java
String bucket_name = "<your bucketname>";
String[] object_keys = {"keyname1","keyname2","..." };

try {
    DeleteObjectsRequest dor = new DeleteObjectsRequest(bucket_name)
        .withKeys(object_keys);
    s3.deleteObjects(dor);
} catch (AmazonServiceException e) {
    System.err.println(e.getErrorMessage());
    System.exit(1);
}
```
