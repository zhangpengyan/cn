

#### 当前代码: SDK/Go/Go.md
``` go
package main

import (
	"fmt"
  	. "github.com/jdcloud-api/jdcloud-sdk-go/services/vm/apis"
	. "github.com/jdcloud-api/jdcloud-sdk-go/services/vm/client"
	. "github.com/jdcloud-api/jdcloud-sdk-go/core"
)

func main() {
	accessKey := "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	secretKey := "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
	credentials := NewCredentials(accessKey, secretKey)
	client := NewVmClient(credentials)

	req := NewDescribeInstancesRequest("cn-north-1")
	resp, err := client.DescribeInstances(req)
	if err != nil {
		return
	}
	fmt.Println(resp.Result.Instances)
	fmt.Println(resp.Result.TotalCount)
	fmt.Println(len(resp.Result.Instances))
}
```


#### 当前代码: SDK/Go/Go.md
```go
const securityTokenHeader = "x-jdcloud-security-token"
req := NewDeleteInstanceRequest("cn-north-1", "i-xxxxx")
req.AddHeader(securityTokenHeader, "xxx")
resp, err := client.DeleteInstance(req)
```


#### 当前代码: SDK/Java/Java.md
```
<!-- 对应产品线的SDK -->
<dependency>
    <groupId>com.jdcloud.sdk</groupId>
    <artifactId>vm</artifactId>
    <version>0.6.1</version>
</dependency>
```


#### 当前代码: SDK/Java/Java.md
```
	import com.jdcloud.sdk.JdcloudSdkException;
	import com.jdcloud.sdk.auth.CredentialsProvider;
	import com.jdcloud.sdk.auth.StaticCredentialsProvider;
	import com.jdcloud.sdk.http.HttpRequestConfig;
	import com.jdcloud.sdk.http.Protocol;
	import com.jdcloud.sdk.service.vm.client.VmClient;
	import com.jdcloud.sdk.service.vm.model.*;
	
	public class VmClientExample {

	    public static void main(String[] args) {
	        //1. 设置accessKey和secretKey
	        String accessKeyId = "{accessKey}";
	        String secretAccessKey = "{secretKey}";
	        CredentialsProvider credentialsProvider = new StaticCredentialsProvider(accessKeyId, secretAccessKey);

	        //2. 创建XXXClient
	        VmClient vmClient = VmClient.builder()
	                .credentialsProvider(credentialsProvider)
	                .httpRequestConfig(new HttpRequestConfig.Builder().protocol(Protocol.HTTPS).build()) //默认为HTTPS
	                .build();

	        //3. 设置请求参数
	        DescribeInstanceRequest request = new DescribeInstanceRequest();
	        request.regionId("cn-north-1");
	        request.instanceId("i-c0se9uju");

	        //4. 执行请求
	        try {
	            DescribeInstanceResponse response = vmClient.describeInstance(request);

	            //返回业务错误
	            if(response.getError() != null) {
	                //调用API返回业务错误，错误处理
	                System.out.println(response.getRequestId() + " failed: " + response.getError().getMessage());
	                return;
	            }
	            DescribeInstanceResult result = response.getResult();
	            // 5.正常返回了result，使用返回数据后续处理
 	       }catch (JdcloudSdkException jse) {
	            //调用API失败，错误处理
 	       }
	    }
	}
```


#### 当前代码: SDK/Python/Python.md
```python
# coding=utf-8
from jdcloud_sdk.core.credential import Credential
from jdcloud_sdk.services.vm.client.VmClient import VmClient
from jdcloud_sdk.services.vm.apis.DescribeInstanceTypesRequest \
    import DescribeInstanceTypesParameters, DescribeInstanceTypesRequest

access_key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
secret_key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
credential = Credential(access_key, secret_key)
client = VmClient(credential)

try:
    parameters = DescribeInstanceTypesParameters('cn-north-1')
    request = DescribeInstanceTypesRequest(parameters)
    resp = client.send(request)
    if resp.error is not None:
        print(resp.error.code, resp.error.message)
    print(resp.result)
except Exception as e:
    print(e)
    # 错误处理
```


#### 当前代码: SDK/Python/Python.md
```python
parameters = DeleteInstanceParameters('cn-north-1', 'i-xxx')
header = {'x-jdcloud-security-token': 'xxx'} 
request = DeleteInstanceRequest(parameters, header)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
sudo apt-get install g++ cmake libssl-dev uuid-dev
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
include_directories(${PROJECT_SOURCE_DIR}/h)
include_directories(${PROJECT_SOURCE_DIR}/http)
include_directories(${PROJECT_SOURCE_DIR}/util)
include_directories(${PROJECT_SOURCE_DIR}/util/crypto)
include_directories(${PROJECT_SOURCE_DIR}/util/logging)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
link_libraries(${PROJECT_SOURCE_DIR}/libjdcloudsigner.a)
link_libraries(ssl)
link_libraries(crypto)
link_libraries(uuid)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
cmake .
make
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
brew install cmake
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
include_directories(${PROJECT_SOURCE_DIR}/h)
include_directories(${PROJECT_SOURCE_DIR}/http)
include_directories(${PROJECT_SOURCE_DIR}/util)
include_directories(${PROJECT_SOURCE_DIR}/util/crypto)
include_directories(${PROJECT_SOURCE_DIR}/util/logging)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
link_libraries(${PROJECT_SOURCE_DIR}/libjdcloudsigner.a)
link_libraries(ssl)
link_libraries(crypto)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
cmake .
make
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
include_directories(${PROJECT_SOURCE_DIR}/h)
include_directories(${PROJECT_SOURCE_DIR}/http)
include_directories(${PROJECT_SOURCE_DIR}/util)
include_directories(${PROJECT_SOURCE_DIR}/util/crypto)
include_directories(${PROJECT_SOURCE_DIR}/util/logging)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
link_libraries(${PROJECT_SOURCE_DIR}/jdcloudsigner.lib)
link_libraries(${PROJECT_SOURCE_DIR}/libeay32.lib)
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
cmake .
devenv Demo.sln /build
```


#### 当前代码: SDK/cplusplus/cplusplus.md
```
// 引用头文件
#include "Credential.h"
#include "JdcloudSigner.h"
#include "http/HttpTypes.h"
#include "http/HttpRequest.h"
#include "util/logging/Logging.h"
#include "util/logging/ConsoleLogSystem.h"

// 配置日志
ConsoleLogSystem* cls = new ConsoleLogSystem(LogLevel::Debug);
shared_ptr<ConsoleLogSystem> log(cls);
InitializeLogging(log);

// 创建HttpRequest对象
HttpRequest request(URI("YOUR URL"), HttpMethod::HTTP_GET);
request.SetHeaderValue(CONTENT_TYPE_HEADER, "application/json");
request.SetHeaderValue(USER_AGENT_HEADER, "JdcloudSdkGo/1.0.2 vm/0.7.4");

// 创建签名对象
Credential credential("YOUR AK", "YOUR SK");
JdcloudSigner signer(credential, "vm", "cn-north-1");

// 调用签名方法
bool result = signer.SignRequest(request);
if(result)
{
    // 把Header中的三项 "Authorization、x-jdcloud-date、x-jdcloud-nonce" 放到真正的请求头中
    // 向京东云网关发起HTTP请求
}
else
{
    return;
}
```


#### 当前代码: SDK/dotnet/dotnet.md
```powershell
Install-Package JDCloudSDK.Vm -Version 0.7.4.1
```


#### 当前代码: SDK/dotnet/dotnet.md
```powershell
dotnet add package JDCloudSDK.Vm --version 0.7.4.1
```


#### 当前代码: SDK/dotnet/dotnet.md
```csharp
using JDCloudSDK.Core.Auth;
using JDCloudSDK.Core.Client;
using JDCloudSDK.Core.Http;
using Newtonsoft.Json;
using System;
using JDCloudSDK.Vm.Model;
using JDCloudSDK.Vm.Apis;
using JDCloudSDK.Vm.Client;
namespace JDCloudSDK.ConsoleTest
{
    class Program
    {
        static void Main(string[] args)
        {
            //1. 设置accessKey和secretKey
            string accessKeyId = "{accessKey}";
            string secretAccessKey = "{secretKey}";
            CredentialsProvider credentialsProvider = new StaticCredentialsProvider(accessKeyId, secretAccessKey);
            //2. 创建XXXClient
            VmClient vmClient = new VmClient.DefaultBuilder()
                     .CredentialsProvider(credentialsProvider)
                     .HttpRequestConfig(new HttpRequestConfig(Protocol.HTTP,10))
                     .Build();

            //3. 设置请求参数
            DescribeInstanceRequest request = new DescribeInstanceRequest();
            request.RegionId="cn-north-1";
            request.InstanceId="i-c0se9uju";
            //4. 执行请求
            var response = vmClient.DescribeInstance(request).Result;
            Console.WriteLine(JsonConvert.SerializeObject(response))
            Console.ReadLine();
        }
    }
}
```


#### 当前代码: SDK/dotnet/dotnet.md
```csharp
vmClient.SetCustomHeader("x-jdcloud-security-token","xxx");
```


#### 当前代码: SDK/iOS/iOS.md
```shell
    pod install {framework name}
```


#### 当前代码: SDK/iOS/iOS.md
```swift
     dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/jdcloud-api/jdcloud-sdk-ios.git", from: "0.0.1"),
    ]
```


#### 当前代码: SDK/iOS/iOS.md
```swift
        // 京东云官网 申请的 AccessKey 和 SecretAccessKey
        let credentials = Credential(accessKeyId: "your jdcloud ak", secretAccessKey: "your jdcloud sk");
        
        // 初始化调用业务线的客户端
        let vmClient = VmJDCloudClient(credential: credentials)
       
        // 创建请求参数，具体的请求参数查看 OPEN API 调用文档
        let describeInstancesRequest = DescribeInstancesRequest(regionId: "cn-north-1");
       
        // 全局 debug 设定 打开后可以看到签名数据 方便调试
        GlobalConfig.debug = true
        
        // 执行请求，因有异常抛出需要自行处理，如果返回结果中有 AnyObject 类型需要 自行使用 SwiftJson 等框架处理resultString ，而requestResponse 中不会包含AnyObject 类型的结果
        try vmClient.describeInstancesAsync(request: describeInstancesRequest) { (statusCode, requestResponse, error,resultString) in
            // 回调方法执行自己的业务逻辑
            print(statusCode)
            print(requestResponse)
            print(error)
```
