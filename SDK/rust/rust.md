# 京东云 Rust 签名库
## 基本说明
京东云Rust签名工具提供了Rust语言访问京东云OpenAPI时的请求签名功能。

在开始调用京东云open API之前，需提前在京东云用户中心账户管理下的[AccessKey管理页面](https://uc.jdcloud.com/accesskey/index)申请accesskey和secretKey密钥对（简称AK/SK）。AK/SK信息请妥善保管，如果遗失可能会造成非法用户使用此信息操作您在云上的资源，给你造成数据和财产损失。


## Usage: 普通方式

### Cargo.toml

添加如下一段到你的 Cargo.toml

```
[dependencies]
jdcloud_signer = "0.1"
```

### 使用范例

```Rust
use jdcloud_signer::{Credential, Signer, Client};
use http::Request;
use serde_json::Value;

fn main() {
    let ak = "...";
    let sk = "...";
    let credential = Credential::new(ak, sk);
    let signer = Signer::new(credential, "vm".to_string(), "cn-north-1".to_string());

    let mut req = Request::builder();
    let mut req = req.method("GET")
        .uri("https://vm.jdcloud-api.com/v1/regions/cn-north-1/instances")
        .body("".to_string()).unwrap();
    signer.sign_request(&mut req).unwrap();

    let client = Client::new();
    let mut res = client.execute(req).unwrap();

    println!("status: {}", res.status());
    for header in res.headers().into_iter() {
        println!("{}: {:?}", header.0, header.1);
    }
    let text = res.text().unwrap();
    let json: Value = serde_json::from_str(&text).unwrap();
    println!("requestId: {}", json["requestId"]);
}
```

## Usage: 只签名方式

如果你不喜欢 `reqwest`, 准备使用自己的http库，那么可以选择只做签名。

签名时我们会添加如下几个 Header 字段

* `User-Agent`: 如果未指定，那么设为 "JdcloudSdkRust/0.1.0", 如果已指定，则不做改动。
* `X-Jdcloud-Date`: 当前时间。
* `X-Jdcloud-Nonce`: 随机数。
* `Authorization`: 签名。

### Cargo.toml

添加如下一段到你的 Cargo.toml

```
[dependencies]
jdcloud_signer = { version = "0.1", default-features = false }
```

### 使用范例

```Rust
use jdcloud_signer::{Credential, Signer};
use http::Request;

fn main() {
    let ak = "...";
    let sk = "...";
    let credential = Credential::new(ak, sk);
    let signer = Signer::new(credential, "vm".to_string(), "cn-north-1".to_string());

    let mut req = Request::builder();
    let mut req = req.method("GET")
        .uri("https://vm.jdcloud-api.com/v1/regions/cn-north-1/instances")
        .body("".to_string()).unwrap();
    signer.sign_request(&mut req).unwrap();
    println!("{}", req);
}
```
