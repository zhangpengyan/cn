# 删除密钥

当用户想要对指定密钥进行销毁时，可以执行**计划删除密钥**操作，执行计划删除操作后，密钥不会立即删除，KMS会将该操作按用户指定时间推迟计划执行（延迟时间范围为7-30天）.

当密钥状态为计划删除时，用户将不能使用该密钥进行加解密任何数据。在计划删除时间未到时，若用户需要重新使用该密钥，可以执行取消删除密钥操作并重新启用该密钥。若超过计划删除时间，则该密钥将被KMS永久删除，使用该密钥加密的数据将无法解密，请用户谨慎操作。

![删除密钥](/image/Key-Management-Service/Key-Management/计划删除密钥弹窗.png)

# 相关参考
- [OpenAPI删除密钥](/API/Key-Management-Service/Key-Management-Service/scheduleKeyDeletion.md)
- [OpenAPI取消删除密钥](/API/Key-Management-Service/Key-Management-Service/cancelKeyDeletion.md)
