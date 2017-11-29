
框架技术spring cloud(Finchley.M2) + mysql + mongodb + redis
# 监控
* 提供多机实时监控，量化系统性能，能快速定位问题，如能定位最慢sql、能定位返回结果集大的sql和最慢运行的代码在哪等
* 提供警告, 1:未关闭连接;2:for update不加事务;3:sql没有加上where;4:事务个数大于1;5:多个操作SQL没有事务6:sql注入风险7:POST请求了支持GET的接口
# 纵向扩展
* 日志使用异步方式，支持在增加服务器性能同时，软件性能也更好提高
# 横向扩展
* 利用spring cloud的注册服务、网关等特性，支持分布式应用，防止单点故障
* 使用JWT更好支持分布式登录（没有使用session或redis缓存）
* 使用网关缓存本地位图方式，统一过滤菜单权限和操作权限，更好支持分布式应用
* 使用支持多机实时监控平台，更好的了解应用状况
# 可维护性
* 支持单机模式，在系统很小时使用，降低系统和开发的复杂度
* 网关跟注册服务合并一起，在系统不是特别大时，降低系统和开发的复杂度
* 配置真正做到一键发布，不覆盖原有配置，一个包可多环境运行
# 安全性
* 高效防止越权漏洞
	1.使用网关统一处理请求，通过本地缓存位图数据控制URI权限，然后把操作权限写入请求header来控制操作按键
	2.使用简单代码实现预防参数攻击,如代码update(bean, new LimitRecord("MERCHANT_ID", merchantId))
* 高效防止SQL注入漏洞，并有警告
* 高效防止XSS跨站漏洞
* 高效防止CSRF跨站请求伪造(支持分布式令牌)
* 高效防止登录测试
* 防止HTTP慢连接拒绝服务攻击漏洞和Cookie修改攻
# 客户体验
* 点击页面后延迟n毫秒再判断是否要出现loading页,并防止重复提交
# 快速开发
* 高效的代码，如update(bean, new LimitRecord("MERCHANT_ID", merchantId), "LOGIN_ACCOUNT")，
  有效防止并发修改登录账号和插入非法数据攻击
* 能一步做完，不用两步，如代码修改共用工程代码而不需要使用link方式等
* 尽量少的代码实现功能，而不是使用代码生产器
# 高性能的数据库设计
更符合规范和实际应用的概念模型设计，去掉一个if写到底的方式，高效利用索引并能高效开发


