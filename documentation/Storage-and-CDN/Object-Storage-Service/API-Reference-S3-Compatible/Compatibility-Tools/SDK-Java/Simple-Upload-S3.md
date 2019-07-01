# 简单上传

流式上传、普通上传称为简单上传。流式上传，使用InputStream作为Object数据源；文件上传使用本地文件作为Object数据源。单个文件大于5G请使用分片上传。

## 流式上传

```Java
String bucket_name = "<your bucketname>";
String file_path = "<your path>";
String key = Paths.get(file_path).getFileName().toString();

//获取输入流
InputStream inputStream = new FileInputStream(file_path);

ObjectMetadata objectMetadata = new ObjectMetadata();
objectMetadata.setContentType("<your contentType>");
objectMetadata.setContentLength(new File(file_path).length());

//上传文件流
try {
    s3.putObject(bucket_name, key, inputStream, objectMetadata);
    System.out.format("Uploading %s to OSS bucket %s...\n", key, bucket_name);
} catch (AmazonServiceException e) {
    e.printStackTrace();
}
```

## 普通上传

```Java
String bucket_name = "<your bucketname>";
String file_path = "<your path>";
String key = Paths.get(file_path).getFileName().toString();

try {
    s3.putObject(bucket_name, key, new File(file_path));
    System.out.format("Uploading %s to OSS bucket %s...\n", key, bucket_name);
} catch (AmazonServiceException e) {
    e.printStackTrace();
} 
```
