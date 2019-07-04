# createKey


## 描述
创建一个CMK（用户主密钥），默认为启用状态

## 请求方式
POST

## 请求地址
https://kms.jdcloud-api.com/v1/key:create


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyCfg**|KeyCfg|True| | |

### KeyCfg
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyDescCfg**|KeyDescCfg|True| |密钥描述配置|
|**keyRotateCfg**|KeyRotateCfg|True| |密钥轮换配置|
### KeyDescCfg
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyDesc**|String|True| |key描述，默认为""|
|**keyName**|String|True| |key名称，默认为""|
### KeyRotateCfg
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**autoRotate**|Boolean|True| |是否自动轮换，默认为false|
|**rotationCycle**|Integer|True| |自动轮换周期，单位为（天），默认为0（永不轮换）|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
