* STOCK_NUM 修改时，使用加或减，而不是修改

* MySQL NOT EXISTS优化的一个案例 去掉not exists
  explain select * from test t where not exists (select 1 from test2 t2 where t2.TEST_ID = t.TEST_ID)
  explain select * from test t left join test2 t2 on t.TEST_ID = t2.TEST_ID where t2.TEST_ID IS NULL

* delete后，之前的自增序列最大值还是会被重用
解决办法是:使用alter table XXX auto_increament=0
int 4 -21亿~+21亿

*添加auto_increment:在物理模型的Domains里ID，Identify:打勾

* 转换成物理模型时:Fk column name template:PARENT_%COLUMN%或使用ROLE

* 如何删除部分数据(参考git的思想，删除就是修改)
> 用create table ... select * from ... where ... 然后改名加索引
  
