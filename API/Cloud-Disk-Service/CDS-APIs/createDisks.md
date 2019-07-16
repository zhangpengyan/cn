# createDisks


## 描述
按照指定配置创建一块或多块云硬盘

- 云硬盘类型可以选择ssd（即将下线）、premium-hdd（即将下线）或者hdd.std1、ssd.gp1、ssd.io1
- 磁盘大小
    - ssd：范围[20,1000]GiB，步长为10GiB, iops为固定值
    - premium-hdd：范围[20,3000]GiB，步长为10GiB, iops为固定值
    - hdd.std1: 容量型hdd，范围[20,16000]GiB，步长为10GiB, iops为计算得出，与购买磁盘的容量成正比
    - ssd.gp1: 通用型ssd，范围[20,16000]GiB，步长为10GiB, iops为计算得出，与购买磁盘的容量成正比。
    - ssd.io1: 性能型ssd，范围[20,16000]GiB，步长为10GiB, iops可以通过购买容量计算得出，或者为用户指定。
- 其他
    - 创建完成后，云硬盘状态为 available
    - 可选参数快照 ID用于从快照创建新盘
    - 批量创建时，云硬盘的命名为 硬盘名称-数字，例如 myDisk-1，myDisk-2
    - maxCount为最大努力，不保证一定能达到maxCount


## 请求方式
POST

## 请求地址
https://disk.jdcloud-api.com/v1/regions/{regionId}/disks

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**diskSpec**|DiskSpec|True| |创建云硬盘规格|
|**maxCount**|Integer|True| |购买实例数量；取值范围：[1,100]|
|**clientToken**|String|True| |幂等性校验参数|

### DiskSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**az**|String|True| |云硬盘所属的可用区|
|**name**|String|True| |云硬盘名称|
|**description**|String|False| |云硬盘描述|
|**diskType**|String|True| |云硬盘类型，取值为ssd、premium-hdd、ssd.gp1、ssd.io1、hdd.std1之一|
|**diskSizeGB**|Integer|True| |云硬盘大小，单位为 GiB；ssd 类型取值范围[20,1000]GB,步长为10G;premium-hdd 类型取值范围[20,3000]GB，步长为10G; ssd.io1 类型取值范围[20,16000]GB,步长为10G; ssd.gp1 类型取值范围[20,16000]GB,步长为10G; hdd.std1 类型取值范围[20,16000]GB,步长为10G|
|**snapshotId**|String|False| |用于创建云硬盘的快照ID|
|**charge**|ChargeSpec|False| |计费配置；如不指定，默认计费类型是后付费-按使用时常付费|
|**multiAttachable**|Boolean|False| |云硬盘是否支持一盘多主机挂载，默认为false（不支持）|
|**encrypt**|Boolean|False| |云硬盘是否加密，默认为false（不加密）|
### ChargeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**chargeMode**|String|False|postpaid_by_duration|计费模式，取值为：prepaid_by_duration，postpaid_by_usage或postpaid_by_duration，prepaid_by_duration表示预付费，postpaid_by_usage表示按用量后付费，postpaid_by_duration表示按配置后付费，默认为postpaid_by_duration.请参阅具体产品线帮助文档确认该产品线支持的计费类型|
|**chargeUnit**|String|False| |预付费计费单位，预付费必填，当chargeMode为prepaid_by_duration时有效，取值为：month、year，默认为month|
|**chargeDuration**|Integer|False| |预付费计费时长，预付费必填，当chargeMode取值为prepaid_by_duration时有效。当chargeUnit为month时取值为：1~9，当chargeUnit为year时取值为：1、2、3|

## 成功的响应

```json
{
    "result": {
        "diskIds": [string]
    },
    "requestId": string
}
```

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|结果集|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**diskIds**|String[]|创建的云硬盘ID列表|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**429**|Quota exceeded|
|**500**|Internal server error|
|**503**|Service unavailable|
