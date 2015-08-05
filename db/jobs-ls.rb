# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8

Job.create(
  employer:		'清朝',
  id:			10001,
  work_year:		2,
  user_id:		10002,
  title:		'太师',
  city:			'北京',
  role:			'掌邦治，为六卿之首',
  company_info:		'清朝',
  addr:			'紫禁城',
  industry:		'权利中枢',
  commission:		'19000',
  requirement:		'德才兼备',
  base_pay:		'18000',
  month:		'15',
  bonus:		'12000',
  allowance:		'20000',
  concall_date:		'2014-11-22',
  memo:			'需要男性',
  bosses_attributes:	{first:{
		   	title:'皇上'}},
  subordinates_attributes: {first:{
			title:'少师',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'孔孟之道',year:15}}
  			)

Job.create(
  employer:		'明朝',
  id:			10002,
  user_id:		10003,
  title:		'尚书',
  city:			'北京',
  role:			'尚书是中国历史上从秦汉时期创立的中央政府官职，其重要性于汉朝达到顶峰，隋唐以后也成为分管六部的重要职官。受到中国文化的影响，朝鲜半岛的高丽王朝亦设有尚书的官职，为六部的最高官员。朝鲜王朝时期，改称判书。越南亦模仿中国官职，设有尚书之职。',
  company_info:		'清朝',
  addr:			'紫禁城',
  industry:		'公务员',
  commission:		'10000',
  requirement:		'1 进士出身
  			2 诗词书画，样样精通
  			3 领导力超群 
  			4 德高望重',
  base_pay:		'10000',
  month:		'13',
  bonus:		'2000',
  allowance:		'5000',
  concall_date:		'2014-10-23',
  memo:			'有股票',
  bosses_attributes:	{first:{
		   	title:'皇上'}},
  work_year:		'2',
  experiences_attributes: {first:{
			skill:'论语',year:1},
			second:{
			skill:'大学',year:9},
			third:{
			skill:'中庸',year:11}}
			)

Job.create(
  id:			10003,
  work_year:		'3',
  user_id:		'10004',
  title:		'PHP程序员',
  city:			'深圳',
  role:			'使用PHP语言开发高可用、高效、稳定的应用及系统服务。在充分理解需求前提下，完成业务逻辑抽象、系统架构设计、数据库结构设计、代码结构设计…代码、文档撰写以及后续运维。完善并遵守团队的编码规范，尊重他人编码风格，编写高质量、高效率、结构清晰、易读、易维护的代码。维护服务的稳定性。充分了解本部门提供的各种服务，并耐心有效地指导外部门正确使用服务。',
  company_info:		'爱推荐是一家由猎头界著名人士发起，由风投注资的高科技企业',
  addr:			'罗湖区',
  industry:		'信息技术',
  commission:		'10000',
  requirement:		'熟悉jQuery、HTML、CSS等Web开发技能，熟悉流行JavaScript框架 ；熟悉ci yaf框架，良好的数据库设计和优化经验，熟悉memcached、redis的使用；熟悉网站构架和性能优化，熟悉各种WEB缓存技术，并有实际的项目经验；',
  base_pay:		'30000',
  month:		'13',
  bonus:		'50000',
  allowance:		'15000',
  concall_date:		'2014-10-23',
  memo:			'更有惊喜哦',
  bosses_attributes:	{first:{
		   	title:'鸟十'}},
  subordinates_attributes: {first:{
			title:'杨13',
			num:'1'}},
  experiences_attributes: {first:{
  			skill:'PHP',year:2}}
			)

Job.create(
  id:			10004,
  work_year:		'3',
  user_id:		'10005',
  title:		'开发总监',
  city:			'上海滩',
  role:			'公司互联网项目核心模块的研发工作，并进行单元测试；参与互联网项目的需求分析，系统设计方面的工作，并撰写技术文档；新技术的研究，汇报，实施以及培训工作；',
  company_info:		'爱推荐是一家由猎头界著名人士发起，由风投注资的高科技企业',
  addr:			'张江高科技园区春晓路11号',
  industry:		'信息技术',
  commission:		'10000',
  requirement:		'负责软件产品功能模块的设计、编码实现和单元测试以及相关文档；负责代码设计、审核和检查；负责软件产品稳定性、性能和扩展性调试。',
  base_pay:		'30000',
  month:		'13',
  bonus:		'50000',
  allowance:		'15000',
  concall_date:		'2014-10-23',
  memo:			'更有惊喜哦',
  bosses_attributes:	{first:{
		   	title:'杨二'}},
  subordinates_attributes: {first:{
			title:'李一',
			num:'1'}},
  experiences_attributes: {first:{
  			skill:'开发管理',year:2}}
			)

Job.create(
  id:			10005,
  work_year:		'3',
  user_id:		'10006',
  title:		'产品总监',
  city:			'上海',
  role:			'负责公司软件产品的技术开发，规范软件开发流程，分析行业技术动态信息，制定公司软件产品中长期技术发展规划，管理软件开发团队，技术可行性分析、架构设计、复杂技术问题攻关，完成副总经理交代的各项事务',
  company_info:		'爱推荐是一家由猎头界著名人士发起，由风投注资的高科技企业',
  addr:			'未来水世界',
  industry:		'信息技术',
  commission:		'10000',
  requirement:		'熟练掌握动态语言(ruby/python/go)开发，有Android和IOS开发经验的优先；具备良好的技术构架能力-MVC构架和REST构架等； 熟悉Linux操作系统，熟悉Mysql数据库没，memcache, git等系统工具；',
  base_pay:		'30000',
  month:		'13',
  bonus:		'50000',
  allowance:		'15000',
  concall_date:		'2014-10-23',
  memo:			'更有惊喜哦',
  bosses_attributes:	{first:{
		   	title:'恐龙'}},
  subordinates_attributes: {first:{
			title:'孔子',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'产品经理',year:2}}
			)

Job.create(
  id:			10006,
  work_year:		'8',
  user_id:		'10006',
  title:		'采购专员',
  city:			'上海',
  role:			'负责公司冷链产品，规范软件开发流程，分析行业技术动态信息，制定公司软件产品中长期技术发展规划，管理软件开发团队，技术可行性分析、架构设计、复杂技术问题攻关，完成副总经理交代的各项事务',
  company_info:		'爱推荐是一家由猎头界著名人士发起，由风投注资的高科技企业',
  addr:			'未来水世界',
  industry:		'信息技术',
  commission:		'10000',
  requirement:		'熟练掌握动态语言(ruby/python/go)开发，有Android和IOS开发经验的优先；具备良好的技术构架能力-MVC构架和REST构架等； 熟悉Linux操作系统，熟悉Mysql数据库没，memcache, git等系统工具；',
  base_pay:		'30000',
  month:		'13',
  bonus:		'50000',
  allowance:		'15000',
  concall_date:		'2014-10-23',
  memo:			'更有惊喜哦',
  bosses_attributes:	{first:{
		   	title:'恐龙'}},
  subordinates_attributes: {first:{
			title:'孔子',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'采购',year:3}}
  			)
Job.create(
  id:			10007,
  work_year:		'3',
  user_id:		'10006',
  title:		'采购专员',
  city:			'上海',
  role:			'负责公司，规范软件开发流程，分析行业技术动态信息，制定公司软件产品中长期技术发展规划，管理软件开发团队，技术可行性分析、架构设计、复杂技术问题攻关，完成副总经理交代的各项事务',
  company_info:		'爱推荐是一家由猎头界著名人士发起，由风投注资的高科技企业',
  addr:			'未来水世界',
  industry:		'信息技术',
  commission:		'10000',
  requirement:		'熟练掌握动态语言(ruby/python/go)开发，有Android和IOS开发经验的优先；具备良好的技术构架能力-MVC构架和REST构架等； 熟悉Linux操作系统，熟悉Mysql数据库没，memcache, git等系统工具；',
  base_pay:		'30000',
  month:		'13',
  bonus:		'50000',
  allowance:		'15000',
  concall_date:		'2014-10-23',
  memo:			'更有惊喜哦',
  bosses_attributes:	{first:{
		   	title:'恐龙'}},
  subordinates_attributes: {first:{
			title:'孔子',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'谈判',year:5}}
  			)
Job.create(
  id:			10008,
  work_year:		2,
  user_id:		10003,
  title:		'律师',
  city:			'上海',
  role:			'打官司',
  company_info:		'大律所',
  addr:			'康定路',
  industry:		'法律',
  commission:		'19000',
  requirement:		'擅长知识产权官司',
  base_pay:		'18000',
  month:		'15',
  bonus:		'12000',
  allowance:		'20000',
  concall_date:		'2014-11-22',
  memo:			'需要女性',
  bosses_attributes:	{first:{
		   	title:'恐龙'}},
  subordinates_attributes: {first:{
			title:'孔子',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'谈判',year:5}}
  			)

Job.create(
  id:			10009,
  work_year:		2,
  user_id:		10002,
  title:		'太师',
  city:			'北京',
  role:			'掌邦治，为六卿之首',
  company_info:		'清朝',
  addr:			'紫禁城',
  industry:		'权利中枢',
  commission:		'19000',
  requirement:		'德才兼备',
  base_pay:		'18000',
  month:		'15',
  bonus:		'12000',
  allowance:		'20000',
  concall_date:		'2014-11-22',
  memo:			'需要男性',
  bosses_attributes:	{first:{
		   	title:'皇上'}},
  subordinates_attributes: {first:{
			title:'少师',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'孔孟之道',year:15}}
  			)

Job.create(
  id:			10010,
  work_year:		2,
  user_id:		10003,
  title:		'殿阁大学士',
  city:			'北京',
  role:			'主要是内阁大学士又称殿阁大学士，一般有大学士或协办大学士，为辅助皇帝的高级秘书官。',
  company_info:		'清朝',
  addr:			'紫禁城',
  industry:		'权利中枢',
  commission:		'19000',
  requirement:		'德才兼备',
  base_pay:		'18000',
  month:		'15',
  bonus:		'12000',
  allowance:		'20000',
  concall_date:		'2014-11-22',
  memo:			'需要男性',
  bosses_attributes:	{first:{
		   	title:'皇上'}},
  subordinates_attributes: {first:{
			title:'百官',
			num:'1'}},
  experiences_attributes: {first:{
			skill:'孔孟之道',year:15}}
  			)

