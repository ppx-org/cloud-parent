* 查看maven依赖
dependency:tree 必须得加一个-Dverbose参数，这时就必定是最全的。加上Dincludes或者Dexcludes说出你喜欢或讨厌，dependency:tree就会帮你过滤出来：
dependency:tree -Dverbose -Dincludes=org.springframework.boot:spring-boot-starter-data-mongodb

