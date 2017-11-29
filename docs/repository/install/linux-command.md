mysql默认端口3306
mongodb默认端口27017
redis默认端口6379

mongod的配置文件:vi /etc/mongod.conf  bindIp

netstat -lanp | grep 27017
systemctl is-enabled mongod.service
systemctl restart mongod.service
systemctl start *.service
systemctl stop *.service
systemctl reload mongod.service

systemctl status mysqld
systemctl is-enabled mysqld


解压:
tar -zxvf *.tar.gz


JAVA_OPTS="-server -Xmx2g -Xms512m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${serverPath}logs/OutOfMemory.dump"
SPRING_OPTS="-Dspring.profiles.active=${profileId}"
nohup ${serverPath}jdk1.8.0_72/bin/java -jar ${serverPath}target/${jarFileName}${timestamp}.jar ${JAVA_OPTS} ${SPRING_OPTS} >>${serverPath}logs/micro_`date +"%Y%m%d"`.log 2>&1 &

nohup /home/dengxz/app/jdk1.8.0_131/bin/java -jar -Dspring.profiles.active=prod /home/dengxz/cloud-demo-0.0.1-SNAPSHOT.jar  >> /home/dengxz/logs/cloud_`date +"%Y%m%d"`.log


nohup /home/dengxz/app/jdk1.8.0_131/bin/java -server -Xmx512m -Xms256m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/home/dengxz/logs/OutOfMemory.dump -jar -Dspring.profiles.active=prod /home/dengxz/cloud-demo-0.0.1-SNAPSHOT.jar  >> /home/dengxz/logs/cloud_`date +"%Y%m%d"`.log


