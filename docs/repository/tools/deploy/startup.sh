#!/bin/sh
# -----------------------------------------------------------------------------
# Start Script for the Micro Server
# -----------------------------------------------------------------------------

timestamp=`date "+%s"`
profileId=$1
serverPath=$2
jarFileName=$3
original=$4
echo timestamp:${timestamp}
echo profileId:${profileId}
echo serverPath:${serverPath}
echo jarFileName:${jarFileName}
echo original:${original}

if [ ! -d ${serverPath}logs ]; then
	mkdir ${serverPath}logs
	mkdir ${serverPath}backup
fi

if [ "${original}" == ".original" ]; then
	# >>>>>>>>>>>>>>不更新jar包，只更新代码 begin
	lastJar=$(ls -t ${serverPath}target/*.jar | head -1)
	echo lastJar:${lastJar}
	# 删除update目录，并解压代码到update
	rm -rf ${serverPath}target/update
	unzip -q ${lastJar} -d ${serverPath}target/update
	# 删除旧代码
	rm -rf ${serverPath}target/update/BOOT-INF/classes
	# 解压新文件
	unzip -q ${serverPath}target/${jarFileName}.original -d ${serverPath}target/update/BOOT-INF/classes
	
	# 备份jar
	mv ${serverPath}target/*.jar ${serverPath}backup/
	mv ${serverPath}target/*.original ${serverPath}backup/

	# 打包
	cd ${serverPath}target/update
	${serverPath}jdk1.8.0_72/bin/jar cfM ${serverPath}target/${jarFileName}${timestamp}.jar BOOT-INF/classes META-INF org
	${serverPath}jdk1.8.0_72/bin/jar uf0 ${serverPath}target/${jarFileName}${timestamp}.jar BOOT-INF/lib
	echo Update Code Success
	# <<<<<<<<<<<<<不更新jar包，只更新代码 end
else
	
	# 改名
	mv ${serverPath}target/${jarFileName} ${serverPath}target/${jarFileName}${timestamp}.jar
	# 备份jar
	mv ${serverPath}target/*.jar ${serverPath}backup/
	mv ${serverPath}backup/${jarFileName}${timestamp}.jar ${serverPath}target/${jarFileName}${timestamp}.jar 
	
	echo Update Full Success
fi


if [ -f ${serverPath}bin/pid ]; then
	kill -9 `cat ${serverPath}bin/pid` > /dev/null 2>&1
fi


JAVA_OPTS="-server -Xms2g -Xms512m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${serverPath}logs/OutOfMemory.dump"
SPRING_OPTS="-Dspring.profiles.active=${profileId}"
nohup ${serverPath}jdk1.8.0_72/bin/java -jar ${serverPath}target/${jarFileName}${timestamp}.jar ${JAVA_OPTS} ${SPRING_OPTS} >>${serverPath}logs/micro_`date +"%Y%m%d"`.log 2>&1 &
pid=$!
echo ${pid} > ${serverPath}bin/pid
ps ${pid}
echo Start Success!


