使用Go语言环境构建，示例jdcloud-build.yml如下

  ```
  cmds:
    - name: '指定工作空间'
      cmd: 'export GOPATH=$(pwd)'
    - name: '创建上传构建包文件夹'
      cmd: 'mkdir -p output'
    - name: '构建命令'
      cmd: 'go install demo'
    - name: '从GOPATH/bin拷贝出生成的构建结果'
      cmd: 'cp -rf bin output'

  # 编译产物存储目录, 必填项
  out_dir: 'output'

  ```
