# 智能配色

## 接口描述
智能配色服务是由单个配色方案智能延展为多个配色结果的实用功能。基于图像智能识别技术，对图像颜色进行精准识别和替换，可用性强，可快速衍生多样的设计风格，大大拓展图片的使用范围，有效降低人工制作成本。

## 请求说明

### 1.请求地址
http://wkorw62jikwy.cn-north-1.jdcloud-api.net/api/fill-image-color/

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
|code|string | 1001 | 参见-[系统级错误码](https://docs.jdcloud.com/cn/photo-filters-matching/error-codes)|
|msg|string | 查询成功 | 参见-[系统级错误码](https://docs.jdcloud.com/cn/photo-filters-matching/error-codes)|
|result|object | {...} | 结果 |

#### （2）业务返回参数
result参数信息

|名称|类型|示例值|描述|
|---|---|---|---|
|status|string | 0 | 返回结果，0表示成功；非0为对应错误号，参见错误码-业务级错误码|
|requestid|string | 6979e9bd79b944b49e0d6e74079d5098 | 请求id |
|message|string | success | 结果状态，成功为 success |
|colored_urls|array | [...] | 处理后的图片地址 |

### 2. 返回示例
```js
{
  "code": 10000,
  "msg": "查询成功",
  "result": {
    "status": 0,
    "message": "OK",
    "requestId": "aa4899f4-db4c-4b09-8aaa-5ecd175e204e",
    "colored_urls": [
      "http://example.com/1.png",
      "http://example.com/2.png",
      "http://example.com/3.png",
    ],
  }
}
```
