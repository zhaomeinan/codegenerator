# codegenerator
代码生成器


## 使用方法
### 1.下载工程，启动项目，项目使用springboot
### 2.访问http://localhost:30000/index/    进入代码生成页面，输入相应的参数

### 3.参数说明

#### 必填字段
<pre><code>
    packageName：生成文件所在的包，不要写磁盘根目录
    srcPath：文件生成的位置
</code></pre>

#### 可选字段
<pre><code>
    destPath：如果想将代码也生成到工程代码的位置，可以在该选项中输入工程主目录位置
    数据库表：输入表名，指定要生成数据库哪个表的相应代码，多个表用逗号分隔，如不输入值，默认生成所有表的
</code></pre>

#### 最后选择要生成的文件：
<pre><code>
    可以选择的文件有:
    pojo
    mapper
    iRepository
    repository
    service
    sqlXml

    选中文件后，可以指定这些文件所在的子工程，不指定默认生成在主目录下
</code></pre>

### 4.修改数据库连接
<pre><code>
    数据库地址需到代码里找到application.properties文件，将连接信息改成自己想要使用的数控地址
    weahan.code.generator.db.connectionUrl：数据库连接
    weahan.code.generator.db.connectionUser：账号
    weahan.code.generator.db.connectionPass：密码
</code></pre>
