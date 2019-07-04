openapi使用简要步骤：

### 1. 准备AKSK

系统用户，请向IAM申请。

个人用户，请在京东云[控制台](https://uc.jdcloud.com/accesskey/index)获取。

### 2. 下载SDK

以Golang 为例，下载以及使用说明参见：[Go](https://docs.jdcloud.com/cn/sdk/go)

### 3. 云解析接口使用的例子

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

先获取主域名：

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

例如：jdclou.com 的domainId = 199，添加www.jdcloud.com 这个子域名的A记录：

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

添加一个免费版套餐的主域名 abcde.com：

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

更多接口，请查阅[概览页](https://docs.jdcloud.com/cn/jd-cloud-dns/api/overview)。
