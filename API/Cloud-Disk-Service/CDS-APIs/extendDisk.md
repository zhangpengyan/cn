# extendDisk

## 描述

扩容云硬盘到指定大小

云硬盘状态必须为 available

## HTTP请求

POST <https://disk.jcloudcs.com/v1/regions/{regionId}/disks/{diskId}:extend>

## 请求参数

### 路径参数

| Param | Type | Required | Desc |
|---|---|---|---|
| regionId | string | Yes | 地域ID |
| diskId | string | Yes | 云硬盘ID |

### 请求Body

```json
{
    "diskSizeGB": int,
    "iops": int
}
```

- 详细描述

| Param | Type | Required | Desc |
|---|---|---|---|
| diskSizeGB | int | Yes | 扩容后的云硬盘大小，单位为GiB |
| iops       | int | No  | 修改后的iops值，当且仅当对ssd.io1型的云盘生效。 |

## 成功的响应

```json
{
    "requestId": string
}
```

- 错误码

| Code | Status | Message |
|---|---|---|
| 400 | INVALID_ARGUMENT | Parameter diskSizeGB missing |
| 400 | INVALID_ARGUMENT | Malformed disk id 'xxx' |
| 400 | INVALID_ARGUMENT | Invalid region 'xxx' |
| 400 | INVALID_ARGUMENT | Invalid diskSizeGB 'xxx' |
| 400 | INVALID_ARGUMENT | Invalid iops number for ssd.io1 |
| 400 | FAILED_PRECONDITION | Invalid disk status 'xxx' |
| 404 | NOT_FOUND | Disk 'xxx' not found |
| 500 | INTERNAL | Internal server error |
| 500 | UNKNOWN | Unknown server error |
| 503 | SERVICE UNAVAILABLE | Service unavailable |
