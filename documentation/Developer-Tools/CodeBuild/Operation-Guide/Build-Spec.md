# 构建规范

构建规范是构建命令及相关设置的编译脚本，采用 YAML 格式。您可以把构建规范脚本放在源代码中，也可以在创建项目时定义。如果在源代码中包含构建规范，构建规范文件必须名为 jdcloud-build.yml 且放置在源目录的根目录中。

构建规范语法如下：

```
---
# 设置环境变量
#envs:
#  - name: 'name1' 环境变量的名称
#    value: 'value1' 环境变量的值
#  - name: 'name2' 用列表的方式设置多个值
#    value: 'value2'

# 设置编译命令
#cmds: 
#  - name: 'do make'  编译步骤名称
#    cmd: 'make'      编译命令，默认 PATH 路径下执行，其他请写明绝对路径
#  - name: 'do install'
#    cmd: 'make install'
cmds:
  - name: 'make output dir'
    cmd: 'mkdir -p output bin var src'
  - name: 'copy to output dir'
    cmd: 'cp -r bin var src output'

# 编译产物存储目录, 必填项
out_dir: 'output'
```

