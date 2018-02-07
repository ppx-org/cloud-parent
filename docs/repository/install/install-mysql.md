centos7下快速安装mysql5.6(CentOS 7的yum源中貌似没有正常安装mysql时的mysql-sever文件，需要去官网上下载)
```
# wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
# rpm -ivh mysql-community-release-el7-5.noarch.rpm
# yum install mysql-community-server
```
成功安装之后重启mysql服务
```
# service mysqld restart
```
#设置密码(初次安装mysql是root账户是没有密码的)
```
# mysql -u root
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('deng');
mysql> exit
```
# 远程授权连接mysql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'deng' WITH GRANT OPTION;
FLUSH PRIVILEGES;


