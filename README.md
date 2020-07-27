# 本分支存储，awtrix_clean的组件，需要自己修改sh文件

# 本分支运行成功，on Port 7000/7001 YES!!!
- 修改sh文件中awtrix为awtrix1
- jar包的位置不变，名称不变

# 整个流程如下：
- mkdir xxx
- cd xxx
- git init
- git 克隆分支：git clone -b <分支名> <仓库地址>
- 除了sh文件，jar文件，其余的rm -rf /xxx /xxxx /xxxxx删除
- 修改sh文件，修改awtrix的名字，不能与前面重合，因为会用来生成service。
- sh文件中的jar路径自己修改，文件夹路径修改，修改成当前的对应的。
- 运行sh awtrix.sh 就可以生成服务了
- 在生成的文件夹中config中setting修改port的值为想要的，
- 在vscode中修改对应的hostport值，存放在Port[5]中，然后upload，自己连上esp89266的wifi，输入wifi账号密码，ip地址，hostport(要与前面对应) 再save
- 然后进入http://[服务器的ip]:your_hostport
- 就可以开始自己下载应用了！！！


# 下载了独立的应用！！！
