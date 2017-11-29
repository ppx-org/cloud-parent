*表对应Java Bean生成
1.新一个JPA工程
2.选JPA工程，右键->JPA Tools->General Entities from tables...
->配置连接数据库的配置,参数可参考
micro-service/src/main/config/config/application-dev.properties
->选Schema和Tables->Finish
3.打开Java Bean文件，Ctrl+F->
  Find:输入\@\S+,Regular expressions打上勾->点击Replace All
