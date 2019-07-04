# SDK 示例

## Java 调用方式

### 1、引入依赖

```
    <!-- 京东云SDK核心包 -->
    <dependency>
        <groupId>com.jdcloud.sdk</groupId>
        <artifactId>core</artifactId>
        <version>1.0.0</version>
    </dependency>
    <!-- 直播的SDK -->
    <dependency>
        <groupId>com.jdcloud.sdk</groupId>
        <artifactId>live</artifactId>
        <version>${version}</version>
    </dependency>
```

### 2、调用步骤

#### Step 1.设置accessKey和secretKey

#### Step 2.创建Client

#### Step 3.设置请求参数

#### Step 4.执行请求得到响应


#### 以下是查询单个直播域名详情的调用示例

```java

    import com.jdcloud.sdk.JdcloudSdkException;
    import com.jdcloud.sdk.auth.CredentialsProvider;
    import com.jdcloud.sdk.auth.StaticCredentialsProvider;
    import com.jdcloud.sdk.http.HttpRequestConfig;
    import com.jdcloud.sdk.http.Protocol;
    import com.jdcloud.sdk.service.live.client.LiveClient;
    import com.jdcloud.sdk.service.live.model.DescribeLiveDomainDetailRequest;
    import com.jdcloud.sdk.service.live.model.DescribeLiveDomainDetailResponse;
    import com.jdcloud.sdk.service.live.model.DescribeLiveDomainDetailResult;
     
     
    public class LiveOpenAPIExample {
        public static void main(String[] args) {
            //1. 设置accessKey和secretKey
            String accessKeyId = "{accessKey}";
            String secretAccessKey = "{secretKey}";
            CredentialsProvider credentialsProvider = new StaticCredentialsProvider(accessKeyId, secretAccessKey);
     
            //2. 创建XXXClient
            LiveClient liveClient = LiveClient.builder()
                    .credentialsProvider(credentialsProvider)
                    .httpRequestConfig(new HttpRequestConfig.Builder().protocol(Protocol.HTTPS).build()) //默认为HTTPS
                    .build();
     
            //3. 设置请求参数
            DescribeLiveDomainDetailRequest request = new DescribeLiveDomainDetailRequest();
            request.setPublishDomain("push.live.test.com");
     
            //4. 执行请求
            try {
                DescribeLiveDomainDetailResponse response = liveClient.describeLiveDomainDetail(request);
     
                //返回业务错误
                if (response.getError() != null) {
                    //调用API返回业务错误，错误处理
                    System.out.println(response.getRequestId() + " failed: " + response.getError().getMessage());
                    return;
                }
                DescribeLiveDomainDetailResult result = response.getResult();
                // 5.正常返回了result，使用返回数据后续处理
            } catch (JdcloudSdkException jse) {
                //调用API失败，错误处理
            }
        }
    }
    
```

## 其他调用方式
- GitHub [访问地址](https://github.com/jdcloud-api)