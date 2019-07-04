# 下载
 使用getObject方法，并在请求中提供存储空间名称和对象名称。
 
 ## 下载方式
 
* 下载整个Object：[下载整个Object](getObject-JavaSDK#user-content-1)
* 下载部分object：[范围下载](getObject-JavaSDK#user-content-2) 

<div id="user-content-1"></div>

## 下载整个Object

 ```Java
String bucket_name = "<your bucketname>";
String key = "your keyname";
System.out.format("Downloading %s from S3 bucket %s...\n", key, bucket_name);

try {
    S3Object o = s3.getObject(bucket_name, key);
    S3ObjectInputStream s3is = o.getObjectContent();
    FileOutputStream fos = new FileOutputStream(new File(key));
    byte[] read_buf = new byte[1024];
    int read_len = 0;
    while ((read_len = s3is.read(read_buf)) > 0) {
        fos.write(read_buf, 0, read_len);
    }
    s3is.close();
    fos.close();
} catch (AmazonServiceException e) {
    System.err.println(e.getErrorMessage());
    System.exit(1);
} catch (FileNotFoundException e) {
    System.err.println(e.getMessage());
    System.exit(1);
} catch (IOException e) {
    System.err.println(e.getMessage());
    System.exit(1);
}
    System.out.println("Done!");  

```
<div id="user-content-2"></div>

## 范围下载

```Java
       
String bucket_name = "<your bucketname>";
String key = "<your keyname>";
String file_path = "<your path>";
int start = 1;
int end = 1000;
	    
GetObjectRequest getObjectRequest = new GetObjectRequest(bucket_name, key).withRange(start,end);
s3.getObject(getObjectRequest, new File(file_path));
```
