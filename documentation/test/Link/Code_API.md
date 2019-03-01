

 #### 当前代码: API/JD-Cloud-DNS/example.md	
```	
func initDNSClient() *ClouddnsserviceClient{	
	// 申请到的AKSK, 下面的例子是以系统用户为例	
	accessKey := "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"	
	secretKey := "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"	
	credentials := NewCredentials(accessKey, secretKey)	
 	config := NewConfig()	
	config.SetScheme(SchemeHttp)	
	// 云网关Endpoint	
	config.SetEndpoint("clouddnsservice.jdcloud-api.com")	
 	client := NewClouddnsserviceClient(credentials)	
	client.SetConfig(config)	
	return client	
}	
```	


 #### 当前代码: API/JD-Cloud-DNS/example.md	
```	
func GetDomains() {	
    // 初始化	
	client := initDNSClient()	
	// 请求赋值	
	req := apis.NewGetDomainsRequest("cn-north-1", 1, 10)	
	req.AddHeader("x-jdcloud-pin", "UserName")	
		
	// 做请求	
	resp, err := client.GetDomains(req)	
	// 输出结果	
	if err != nil {	
        client.Logger.Log(1, "err ->", err.Error())	
	} else {	
		if resp.Error.Code != 0 {	
			fmt.Println("Error: ", resp.Error.Status, resp.Error.Message, resp.Error.Code)	
		} else {	
			fmt.Println(resp.Result)	
		}	
	}	
}	
```	


 #### 当前代码: API/JD-Cloud-DNS/example.md	
```	
func AddRR() {	
	//初始化	
	client := initDNSClient()	
	// 请求赋值	
	rr := &models.AddRR {	
        	/* 主机记录  */	
        	HostRecord: "www",	
        	/* 解析记录的值  */	
        	HostValue: "1.2.3.4",	
        	/* 解析记录的生存时间  */	
        	Ttl: 600,	
        	/* 解析的类型  */	
        	Type: "A",	
        	/* 解析线路的ID，请调用getViewTree接口获取解析线路的ID。  */	
        	ViewValue: -1,	
    	}	
	req := apis.NewAddRRRequest("cn-north-1", "199", rr)	
	req.AddHeader("x-jdcloud-pin", "UserName")	
		
	// 做请求	
	resp, err := client.AddRR(req)	
	// 输出结果	
	if err != nil {	
        client.Logger.Log(1, "err ->", err.Error())	
	} else {	
		if resp.Error.Code != 0 {	
			fmt.Println("Error: ", resp.Error.Status, resp.Error.Message, resp.Error.Code)	
		} else {	
			fmt.Println(resp.Result)	
		}	
	}	
}	
```	


 #### 当前代码: API/JD-Cloud-DNS/example.md	
```	
func AddFreeDomain() {	
	//初始化	
	client := initDNSClient()	
 	// 请求赋值	
	req := apis.NewAddDomainRequest("cn-north-1", 0, "abcde.com")	
	req.AddHeader("x-jdcloud-pin", "UserName")	
		
	// 做请求	
	resp, err := client.AddDomain(req)	
 	// 输出结果	
	if err != nil {	
        client.Logger.Log(1, "err ->", err.Error())	
	} else {	
		if resp.Error.Code != 0 {	
			fmt.Println("Error: ", resp.Error.Status, resp.Error.Message, resp.Error.Code)	
		} else {	
			fmt.Println(resp.Result)	
		}	
	}	
}	
```	


 #### 当前代码: API/Key-Management-Service/Introduction.md	
```	
package main	
 import (	
    "encoding/base64"	
    "fmt"	
    core "github.com/jdcloud-api/jdcloud-sdk-go/core"	
    kms "github.com/jdcloud-api/jdcloud-sdk-go/services/kms/apis"	
    client "github.com/jdcloud-api/jdcloud-sdk-go/services/kms/client"	
    models "github.com/jdcloud-api/jdcloud-sdk-go/services/kms/models"	
    "time"	
)	
 func main() {	
    /** 设置Credentials对象 **/	
    accessKey := "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"	
    secretKey := "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"	
    credentials := core.NewCredentials(accessKey, secretKey)	
     /** 设置Config对象 **/	
    config := core.NewConfig()	
    config.SetEndpoint("apigw-test.openapi.jdcloud.com")	
    config.SetScheme("http")	
     /** 设置Client对象 **/	
    client := client.NewKmsClient(credentials)	
    client.SetConfig(config)	
     /** 将待加密的数据进行base64编码 **/	
    data := base64.StdEncoding.EncodeToString([]byte("Hello World."))	
     /** 设置加密所用密钥ID **/	
    keyId = "aabbccddeeffgghh"	
     /** 创建加密请求 **/	
    reqEnc := kms.NewEncryptRequest(keyId)	
    reqEnc.SetPlaintext(data)	
     /** 发送加密请求 **/	
    if resp, err := client.Encrypt(reqEnc); err != nil {	
        /** TODO: error **/	
    } else {	
        /** we get resp.Result.CiphertextBlob **/	
        fmt.Println("Cipher: ", resp.Result.CiphertextBlob)	
    }	
}	
 ```
