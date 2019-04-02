使用Apache Maven构建Java项目，示例jdcloud-build.yml如下：


```
cmds:
  - name: '打包，跳过单元测试;每次构建检查更新'
    cmd: 'mvn package -Dmaven.test.skip=true  -U'
  - name: '从指定目录拷贝构建结果至output目录下'
    cmd: 'cp -rf target/demo-1.0-SNAPSHOT-all output'
    
# 编译产物存储目录, 必填项
out_dir: 'output'

```
