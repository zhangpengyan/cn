使用Npm软件包管理系统管理软件包，示例jdcloud-build.yml如下：

```
cmds:
  - name: '加载依赖'
    cmd: 'npm install'
  - name: '从指定目录拷贝构建结果至output目录下'
    cmd: 'cp -rf bin output'
    
# 编译产物存储目录, 必填项
out_dir: 'output'

```
