# 分片上传

对于大文件，可以切分成片上传。用户可以在如下的应用场景中（但不仅限于此）使用分片上传(Multipart Upload)模式：

- 需要支持断点上传。

- 上传超过5GB大小的文件。

- 网络条件较差，和OSS的服务器之间的链接经常断开。

- 上传文件之前，无法确定上传文件的大小。

分片上传(Multipart Upload)分为如下3个步骤:

- 初始化一个分片上传任务（InitiateMultipartUpload）

- 逐个或并行上传分片（UploadPart）

- 完成分片上传（CompleteMultipartUpload）或取消分片上传(AbortMultipartUpload)。



## 分片上传完整示例

```Java
// 初始化分片上传
String bucket_name = "<your bucketname>";
String file_path = "<your loacl file>";
String key = Paths.get(file_path).getFileName().toString();
File file = new File(file_path);
long contentLength = file.length();
long partSize = 5 * 1024 * 1024; // 设置每个分片大小为5MB.
	    
try {                
// 创建对象的Etag列表，并取回每个分片的Etag。
    List<PartETag> partETags = new ArrayList<PartETag>();
// 初始化分片上传
    InitiateMultipartUploadRequest initRequest = new InitiateMultipartUploadRequest(bucket_name, key);
    InitiateMultipartUploadResult initResponse = s3.initiateMultipartUpload(initRequest);

// 上传分片
    long filePosition = 0;
    for (int i = 1; filePosition < contentLength; i++) {
        partSize = Math.min(partSize, (contentLength - filePosition));
        UploadPartRequest uploadRequest = new UploadPartRequest()
            .withBucketName(bucket_name)
            .withKey(key)
            .withUploadId(initResponse.getUploadId())
            .withPartNumber(i)
            .withFileOffset(filePosition)
            .withFile(file)
            .withPartSize(partSize);
// 上传分片并将返回的Etag加入列表中
        UploadPartResult uploadResult = s3.uploadPart(uploadRequest);
        partETags.add(uploadResult.getPartETag());
        filePosition += partSize;
    }

// 完成分片上传
    CompleteMultipartUploadRequest compRequest = new CompleteMultipartUploadRequest(bucket_name, key,
    initResponse.getUploadId(), partETags);
    s3.completeMultipartUpload(compRequest);
}
catch(AmazonServiceException e) {
    e.printStackTrace();
}
catch(SdkClientException e) {
    e.printStackTrace();
}
```

## 列举分片上传

```Java
String bucket_name = "<your bucketname>";
	    
try {
    ListMultipartUploadsRequest allMultipartUploadsRequest = new ListMultipartUploadsRequest(bucket_name);
    MultipartUploadListing multipartUploadListing = s3.listMultipartUploads(allMultipartUploadsRequest);
    List<MultipartUpload> uploads = multipartUploadListing.getMultipartUploads();
	    	
    System.out.println(uploads.size() + " multipart upload(s) in progress.");
        for (MultipartUpload u : uploads) {
            System.out.println("Upload in progress: Key = \"" + u.getKey() + "\", id = " + u.getUploadId());
        }
}
catch(AmazonServiceException e) {
    e.printStackTrace();
}
catch(SdkClientException e) {
    e.printStackTrace();
}	
```

## 终止分片上传

```Java
String bucket_name = "<your bucketname>";
    
try {
// 列出所有未完成的分片上传
    ListMultipartUploadsRequest allMultipartUploadsRequest = new ListMultipartUploadsRequest(bucket_name);
    MultipartUploadListing multipartUploadListing = s3.listMultipartUploads(allMultipartUploadsRequest);
    List<MultipartUpload> uploads = multipartUploadListing.getMultipartUploads();
    System.out.println("Before deletions, " + uploads.size() + " multipart uploads in progress.");
// 终止分片上传
    for (MultipartUpload u : uploads) {
        System.out.println("Upload in progress: Key = \"" + u.getKey() + "\", id = " + u.getUploadId());    
        s3.abortMultipartUpload(new AbortMultipartUploadRequest(bucket_name, u.getKey(), u.getUploadId()));
        System.out.println("Upload deleted: Key = \"" + u.getKey() + "\", id = " + u.getUploadId());
    }
// 验证未完成的分片上传是否被终止
    multipartUploadListing = s3.listMultipartUploads(allMultipartUploadsRequest);
    uploads = multipartUploadListing.getMultipartUploads();
    System.out.println("After aborting uploads, " + uploads.size() + " multipart uploads in progress.");
}
catch(AmazonServiceException e) {
    e.printStackTrace();
}
catch(SdkClientException e) {
    e.printStackTrace();
}
```
