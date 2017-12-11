框架X2技术spring cloud(Finchley.M2) + mysql + mongodb + redis

* [开发文档](https://github.com/ppx-org/cloud-parent/blob/master/docs/%E5%BC%80%E5%8F%91%E6%96%87%E6%A1%A3.md)

# 一般应用框架存在的问题
* 缺少监控，系统性能无法评估，问题不能快速找到原因；缺少警告,有警告可在开发时就发现问题
* 缺少实时了解每个程序员的开发情况
* 缺少安全性，除了造成风险，还可能造成项目无法验收
* 教科书式构架，全部是controller+service+dao，调用共用jar，不但浪费内存，增加复杂度和沟通成本
* 修改代码需要重启服务
* 需要Link Source，Link Source缺点:1.需要知道Link Source 2.不知是否已经提交 3.查找文件会多出一个
* 难以快速定位文件，通过URI不能立即找到文件
* 缺少对公共类的管理，通过引入jar，导致难找问题，简单调用变成在调用黑盒子的接口，变更没通知
* 出现过多跟业务无法的代码，比如request,response,try catch,debug,toJson之类等，更糟糕的使用字符串拼接
* 缺少系统思考，架构师不懂写代码，数据库设定不懂模型设计，Java程序员不懂写js
* 不支持并发，如在Controller里使用Field，造成多个请求使用同个对象，插入或修改时不支持唯一值
* 功能代码影响范围广，在写独立功能模块时还需要修改共用代码，修改共用配置，代码耦合度高
* 系统不能很好的支持纵向扩展和横向扩展，如使用log4j记日志，使用session，容易出现单点故障
* 一个页面使用多个请求，如查询分页出现页面再异步读数据，并且使用异步请求造成页面跳动，高度难判断
* 关键模块一个if写到底
* 最关键的，哪些不该做，哪些该做。如后台应用菜单:支持iframe又支持div，造成太多奇怪代码

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
更符合规范和实际应用的概念模型设计，关键功能去掉一个if写到底的方式，高效利用索引并能高效开发


