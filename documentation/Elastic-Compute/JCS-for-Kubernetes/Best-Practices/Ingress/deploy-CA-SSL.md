# 自建CA证书和私钥

本文档说明自建CA的步骤，用于配置Https类型的Ingress Resource。如果您已经有证书和私钥，可在[定义Ingress Resource](https://docs.jdcloud.com/cn/jcs-for-kubernetes/Deploy-Ingress-Resource)时直接使用。

## 一、自建CA，用于后续创建数字签名证书

1. 安装cfssl工具集

```
wget https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
mv cfssl_linux-amd64 /usr/bin/cfssl

wget https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
mv cfssljson_linux-amd64 /usr/bin/cfssljson

wget https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
mv cfssl-certinfo_linux-amd64 /usr/bin/cfssl-certinfo
```

2. 创建配置文件

CA 配置文件用于配置根证书的使用场景 (profile) 和具体参数 (usage: 过期时间、服务端认证、客户端认证、加密等)，后续在签名其它证书时需要指定特定场景。

```
mkdir /root/cert
cd /root/cert
cat > ca-config.json <<EOF
{
  "signing": {
    "default": {
      "expiry": "87600h"
    },
    "profiles": {
      "ingress": {
        "usages": [
            "signing",
            "key encipherment",
            "server auth",
            "client auth"
        ],
        "expiry": "87600h"
      }
    }
  }
}
EOF
```

3. 创建证书签名请求文件

```
cd /root/cert
cat > ca-csr.json <<EOF
{
  "CN": "ingress",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "ST": "BeiJing",
      "L": "BeiJing",
      "O": "k8s",
      "OU": "4Paradigm"
    }
  ],
  "ca": {
    "expiry": "876000h"
 }
}
EOF
```

4. 生成CA证书和私钥

```
cd /root/cert
cfssl gencert -initca ca-csr.json | cfssljson -bare ca
ls ca*.pem
```

## 二、创建SSL证书和私钥

1. 创建证书签名请求

```
cd /root/cert
cat > web-server-csr.json <<EOF
{
  "CN": "ingress",
  "hosts": [
    "web-server-test.jdcloud.com"
  ],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "ST": "BeiJing",
      "L": "BeiJing",
      "O": "k8s",
      "OU": "4Paradigm"
    }
  ]
}
EOF
```
2. 申请SSL证书

```
cd /root/cert
cfssl gencert -ca=/root/cert/ca.pem \
  -ca-key=/root/cert/ca-key.pem \
  -config=/root/cert/ca-config.json \
  -profile=ingress web-server-csr.json | cfssljson -bare web-server
ls web-server*.pem
```