# 风格识别

## 接口描述
风格识别服务是能够读取图片信息，实现按照风格进行智能归类管理的功能。由深度学习引擎打造，通过构建样本数据集训练机器，形成风格预测模型，根据模型，可从图片信息识别出风格特征元素，自动判别图片设计风格。

## 请求说明

### 1.请求地址
http://wko74nw3nxr2.cn-north-1.jdcloud-api.net/api/predict-style

### 2.请求方式
POST

### 3. 请求参数
#### （1）header请求参数
|名称|类型|必填|示例值|描述|
|---|---|---|---|---|
|**Authorization**|string| 是 | JDCLOUD2-HMAC-SHA256Credential=access...	| 签名|

#### （2）body请求参数
|名称|类型|必填|示例值|描述|
|---|---|---|---|---|
|**无**|binary| 是 | 无 | 图片内容，传入图片|

### 4. 请求代码示例
建议您使用我们提供的SDK进行调用，SDK获取及调用方式详见sdk的使用方法

## 返回说明

### 1. 返回参数

#### （1）公共返回参数

|名称|类型|示例值|描述|
|---|---|---|---|
|code|string | 1001 | 参见-[系统级错误码](https://docs.jdcloud.com/cn/image-style-classification/error-codes)|
|msg|string | 查询成功 | 参见-[系统级错误码](https://docs.jdcloud.com/cn/image-style-classification/error-codes)|
|result|object | {...} | 结果 |

#### （2）业务返回参数
result参数信息

|名称|类型|示例值|描述|
|---|---|---|---|
|status|string | 0 | 返回结果，0表示成功；非0为对应错误号，参见错误码-业务级错误码|
|requestid|string | 6979e9bd79b944b49e0d6e74079d5098 | 请求id |
|message|string | success | 结果状态，成功为 success |
|styles| array | [ ... ] | 处理后的结果 |

### 2. 返回示例
```js
{
  "code": 10000,
  "msg": "查询成功",
  "result": {
    "status": 0,
    "message": "OK",
    "requestId": "aa4899f4-db4c-4b09-8aaa-5ecd175e204e",
    "styles": [
      {
        "probability": 0.5523,
        "className": "粉嫩柔美"
      },
      {
        "probability": 0.3799,
        "className": "清新淡雅"
      },
      {
        "probability": 0.0279,
        "className": "简约中性"
      }
    ]
  }
}
```
