a=User.new(
  verify:		'hr',
  title:		'CEO',
  city:			'上海',
  id:			'10000',
  mobile:		'13916382071',
  user_name:		'乔吉',
  true_name:		'乔吉',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','george.jpeg')),
  email:		'cvsend@139.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'人事',
  base_salary:		'10000',
  month_num:'13',
  bonus:		'50000',
  housing:	'10200',
  transport:'56000',
  birthday:	'1982-9-11',
  stock:		'',
  stock_num:	'',
  industry:		'快消',
  focus_job1:		'人事',
  summaries_attributes:	{first:{content:'负责产品规格的制定和开发中的项目管理'},
	  		second:{content:'负责产品的coding,包括网页前端和后端的开发'},
			third: {content:'公司的日常管理'}},
  works_attributes:	
  			{first: {title:  'CEO',
	  			employer:'又招了电子商务',
				industry:'信息技术和人力资源',
				join_date:'2012-09-3',
				leave_date:'2014-10-31',
				job_scope:'开发猎头业务,带领猎头团队进行人才搜寻',
				},
			second:{title:'经理',
				employer:'万宝盛华(Manpower)',
				industry:'人力资源',
				join_date:'2012-09-1',
				leave_date:'2014-10-31',
				job_scope:'开发猎头业务,带领猎头团队进行人才搜寻',
				},
			third:{title:'CEO',
				employer:'又招了电子商务',
				industry:'信息技术和人力资源',
				join_date:'2012-09-1',
				leave_date:'2014-10-31',
				job_scope:'开发猎头业务,带领猎头团队进行人才搜寻'}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'计算机',
				degree:'本科',
				school:'浙江大学'}}
  			)


b=User.new(
  title:		'顾问',
  city:			'上海',
  id:			10001,
  mobile:		13916310001,
  user_name:		'Aaron Qin',
  true_name:		'秦义寿',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','Aaron Qin.png')),
  email:		'aaronqin@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'熟悉SAP EDI和portable'},
	  		second:{content:'在博士力士乐多年的工作经验，多次荣膺AA Excellent Employee大奖'},
			third: {content:'良好的沟通技巧，热情的工作态度和开放的心态'}},
  works_attributes:	{first: {title:'SAP顾问',
	  			employer:'博世力士乐',
				industry:'汽车电子',
				join_date:'2007-9-01',
				leave_date:'2010-8-31',
				job_scope:'负责SAP MM模块的日常管理'
				}},
  educations_attributes:{first: {enter_school:'2003-9-1',
	  			leave_school:'2007-9-1',
				major:'计算机',
				degree:'本科',
				school:'上海交通大学'}}
  			)

c=User.new(
  bank_id:		20002,
  title:		'营运经理',
  city:			'苏州',
  id:			10002,
  mobile:		13916310002,
  user_name:		'马贵耀',
  true_name:		'马贵耀',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','马贵耀.png')),
  email:		'mgy@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'本人在13年的工作中积累了丰富的企业管理经验。特别是在公司运营管理和工厂制造管理等方面拥有较为先进且有效的实践经验。'},
			second: {content:'有较强的精益生产和6sigma推行实践经验.对现场控制能力较强.能够熟练运用ERP、MRP�=C8。能够独立管理和领导整个工厂或公司的全面经营'},
			third: {content:'具备较好的团队精神。英语应用熟练，可完全作为工作语言。略懂德语。'}},
  works_attributes:	{first: {title:'运营经理',
	  			employer:'伊顿液压',
				industry:'工业',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'负责伊顿宁波工厂生产部，包括金工车间，装配车间和总成车间以及生产计划，制造工程和工艺管理，设备维修部门的各项管理工作。
				1.建立和完善工厂运营团队的组织架构和管理体系。
				2.组织落实、监督、调控生产过程各项安全、质量、交期、成本、效率等各项BSC指标。
				3.组织实施和推进精益生产文化。
				4.确保ISO质量管理体系在生产运营方面得到良好的运行。
				5.组织制定公司运营年度总预算和每季度预算调整。
				6.根据公司绩效管理体系为运营部门和个人设定合理的年度KPI和绩效目标。
				7.根据销售订单要求制订和调整生产部门月度和每周生产计划以确保完成交货要求。
				8.固定资产和关键重要设备的申购评估，审批和过程管控。
				9.根据年度VSM和VSA进行车间生产布局和规划，并持续发现改进点，有效改进和完善。
				10.通过领导和推进RIE, KAIZEN, 全员合理化建议等持续改进和降低内部全面生产成本。
				11.与技术部门密切合作进行新产品开发、技术和工艺流程革新及产品质量改进，提高材料利用率。
				12.生产营运体系的人员优化配置和组织管理，通过培训和评估体系建立、发展和完善工厂运营团队。
				13.与销售、人力资源、供应链，财务等部门的跨部门沟通协调。
				14.参与工厂Eaton亚太和大中华区各个级别的优秀运营评估和各类内部管理审核。
				15.参与工厂的年度战略规划。
				16.新产品项目及生产运营过程中的新项目推进。
				'
				}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'法学硕士',
				degree:'本科',
				school:'河海大学'}}
  			)

d=User.new(
  title:		'运营经理',
  city:			'南京',
  id:			10003,
  mobile:		13916310003,
  user_name:		'储海春',
  true_name:		'储海春',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','储海春.png')),
  email:		'743278938@139.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'* 具软硬电路板(FPC/PCB), SMT组装, 连接器及消费品产品开发经验，熟悉电镀，注塑，机械及电子组装，影像及蚀刻等生产过程并具有项目质量改善的经验；'},
	                second:{content:'具有若干大中型（包括汽车电子、快速消费电子及多品种小产量类型）的项目立案、价格分析、新产品开发的跨功能、跨国协调的经验；'}},
  works_attributes:	{first: {title:'运营经理',
	  			employer:'XP Power',
				industry:'工业',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'根据公司中长期目标，发展和实施相应策略和措施，管理和控制营运部门包括生产、计划、项目、工程、物料及物流以达成工厂营运成本、产品交期和质量的目标'}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'法学硕士',
				degree:'本科',
				school:'江西工业大学'}}
  			)

e=User.new(
  title:		'物流总监',
  city:			'南京',
  id:			10004,
  mobile:		13916310004,
  user_name:		'朱明',
  true_name:		'Ming',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','Ming.png')),
  email:		'zm@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'23000',
  month_num:		'13',
  bonus:		'52000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'上海财经大学全日制工商管理硕士。南京大学国际金融学士，十五年工作经验，精通电子商务物流仓储配送运作管理，擅长物流运营体系规划与仓库规划，WMS/ERP/CRM系统规划,拥有丰富的电子商务物流体系拓展,开仓,规划等经验.熟悉人员招募,培训,管理. 优秀的团队管理能力，团队培养建设能力，很强的流程优化与设计能力，责任心强,独立工作能力极强，有承担与解决问题的能力.'}},
  works_attributes:	{first: {title:'物流总监',
	  			employer:'俏物悄语',
				industry:'电商',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'负责仓储运营的管理，包括：计划,收货,上架,拣货,包装,盘点,下架,退货,QC,辑核客退，防损等部门操作的管理、协调与控制，以及耗材使用的物料计划及库存管理; '}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'物流专业',
				degree:'本科',
				school:'上海大学'}}
)

f=User.new(
  title:		'软件工程师',
  city:			'宁波',
  id:			10005,
  mobile:		13916310005,
  user_name:		'Minnie She',
  true_name:		'佘俊芝',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','MinnieShe.png')),
  email:		'minnieshe@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'本人性格热忱开朗,善于与人沟通,工作认真负责,不怕吃苦,具有很强的团队精神,协调和沟通能力,有强烈的集体荣誉感。 '}},
  works_attributes:	{first: {title:'软件工程师',
	  			employer:'讯孚软件',
				industry:'软件开发',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'我们为耀庭国际物流公司开发的库存管理系统,主要方便管理仓库的货物出入,以及记录货物的详细信息.
				【系统界面】 
				系统的UI界面,为客户提供友好的操作界面. 
				1)货物管理:搭建货物管理的前台界面,提供货物出入库的添加操作.
				2)档案设置:搭建档案设置的前台界面,提供档案的添加、删除、修改操作.
				3)查询统计:搭建查询统计的前台界面,提供所有数据的查询操作.
				4)系统维护:搭建系统维护的前台界面,提供数据管理的操作. 
				【货物管理】 
				货物管理的后台管理，为客户提供货物的出入库操作.
				1)入库管理:为货物的入库提供 货物编号、名称、数量 等 一些操作. 
				2)出库管理:为货物的出库提供 货物编号、名称、数量 等 一些操作. 
				3)借货还货管理:添加货物的借出的记录信息.
				4)还货管理:添加货物的归还的记录信息.
				',
				}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'计算机',
				degree:'本科',
				school:'厦门大学'}}
  			)


g=User.new(
  title:		'采购经理',
  city:			'洛阳',
  id:			10006,
  mobile:		13916310006,
  user_name:		'余婷章',
  true_name:		'余婷章',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','余婷章.png')),
  email:		'ytz@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'工作细心负责，适应能力强，能尽快从订单跟踪的初级角色转变为需要与供应商沟通更敏感的价格的角色。能及时处理各类紧急事件，如库存盘亏时产生的突然需求，如项目即将结束前突然的增量。
	  能有效与人沟通，与同事相处融洽，对待供应商更是以真诚的态度获取他们的信任与支持。
	  '},
	                second:{content:'生活中我喜欢参加游泳、瑜伽、跳舞等活动。'},
			third: {content:'我相信只有不断的学习才能不断成长，曾为了解更多的采购知识信息主动参加2009年ISM China年会'},
			fourth:{content:'目前正积极自学CPSM教程。希望有一个更高的平台发挥我的能力。'}},
  works_attributes:	{first: {title:'采购经理',
	  			employer:'联想(上海)电子科技有限公司',
				industry:'电子',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'先期作为原材料采购，主要负责1）每日查看SAP系统，根据公司内部用料需求制作采购订单。 
				2）监督供应商按时、保质、保量出货。
				3）根据公司对供应商战略、及供应商生产能力分配物料采购。
				4）根据生产计划部、客户跟单部的特殊要求，对紧急物料的跟催。
				5）处理供应商来料时因材料或包装不合格引起的退换货问题。
				6）定期向供应商提供物料需求计划，以便供应商备库。
				7）维护物料编号及价格。
				8）定期评估供应商送货准时率、服务水平、供应能力、社会责任等各方面指标，并督促其持续改进。 
				9）对主要供应商进行年度审核，保证其发展符合公司战略需要。 
				'}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'电子信息',
				degree:'本科',
				school:'南京大学'}}
  			)

h=User.new(
  title:		'生产经理',
  city:			'上海',
  id:			10007,
  mobile:		13916310007,
  user_name:		'刘海健',
  true_name:		'刘海健',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','刘海建.png')),
  email:		'lhj@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'丰富的制造业跨国公司和制造业解决方案工作经验，15年的项目管理和营运经验'},
			second:{content:'丰富的计划和战略能力，领导多文化团队工作经验'},
			third:{content:'推动活动，优秀的分析问题和解决问题的能力'}
			},
  works_attributes:	{first: {title:'生产经理',
	  			employer:'江阴万奇内饰系统有限公司',
				industry:'汽车零部件',
				join_date:'2013.1.1',
				leave_date:'2015.1.1',
				job_scope:'•	重新建立高效的公司组织架构，建立规划制造设施和对所有资源的有效使用的规划.
				•	直接管理包括生产，质量，工程，采购，财务，人力资源和物流等部门.
				•	全面负责本地业务的操作和执行，开发和提交计划及定期目标.
				•	带领一组高度积极的管理团队来定义和执行计划，以达成财务目标及结果
				•	执行公司的策略和指导方针，倡导良好的公司文化和团队合作.
				•	开发节约成本和高质量合格的供应商，保持产品高标准的质量要求，领导ISO9001/TS16949质量体系的实施.
				'}},
  educations_attributes:{first: {enter_school:'1993.9.1',
	  			leave_school:'1997.7.1',
				major:'机械电子专业',
				degree:'本科',
				school:'山东建筑大学'}}
  			)

i=User.new(
  title:		'开发工程师',
  city:			'上海',
  id:			10008,
  mobile:		13916310008,
  user_name:		'刘栋',
  true_name:		'Liu Dong',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','刘栋.png')),
  email:		'ld@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'熟悉PHP、Perl、编程，熟悉mysql， 是公司产品的网页部分开发的主要人员'},
			sedond:{content:'熟悉Javascript、Jqeury和前端MVC框架Backbone.js'},
			third:{content:'使用过Mustache、Seajs、Bootstrap和MVC框架CI'}},
  works_attributes:	{first: {title:'开发工程师',
	  			employer:'上海优刻得云计算技术有限公司',
				industry:'计算机',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'cdn控制台的开发包括html+css+js+php的前后端开发,公司主营产品云主机控制台（富客户端）的开发，主要负责html+css+js+php的前后端开发以及参与需求讨论和产品发布'}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'软件工程',
				degree:'本科',
				school:'山东科技大学'}}
			)
j=User.new(
  city:			'嘉兴',
  id:			10009,
  mobile:		13916310009,
  user_name:		'代洪彪',
  true_name:		'Dai',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','代洪彪.png')),
  email:		'dhb@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'参加过ISO9001,ISO14000,TS16949，6SIGMA培训并获得内审证书。 能熟练运用MEA,8D,QA,6SIGMA等统计手法解决生产品质异常。'},
	  		second:{content:'熟练植入精益生产于公司（在诺普信植入吨桶--CELL生产方式降低成品库存51%'},
	  		third: {content:'本人工业工程专业，从事IE/精益生产方面工作已经10多年，在流畅制造，丰田生产积累大量的工作经验，有较强的团队领导协作能力和项目推行能力'},
	  		fouth: {content:'掌握精益生产的推动，包括：5S,TPM,QCC,CELL线架设，TOC.均衡化生产，TPM，JIT，自动化和工业工程以及企业信息化专业知识；'},
	  		fifth: {content:'对LP系统规划及改善有极强的项目推动能力。熟悉日常IE,规划IE组织，品质系统手法，厂房规划，成本核算以及效率评估分析，设备嫁动率提高，设备管理等，对6SIGM项目有一定的推动能力，熟悉ERP，ERP2，SAP等系统；'},
	  		sixth:{content:'熟悉工厂生产运作流程，如电五金塑胶行业（五金冲压、注塑成型、吹塑成型、喷涂印刷、机加工组装等工艺）、化工行业（制药反应流程及工艺、灌装包装流程及工艺、包装设备的引进以及改善等）、汽车行业，汽车零配件行业流程改善；'},
	  		seventh:{content:'能够灵活与各部门进行良好的沟通，对公司质量与生产效率进行PDCA的方式改善，共同提高公司的效益'},
	  		eighth:{content:'擅长发现、思考、挑战生活中的新事物，具有对产品在制程中与设计上的改善的能力；具有较强的思考技巧，能够快速敏捷找到解决方案的方法。'}},
  works_attributes:	{first: {title:'生产经理',
	  			employer:'北汽模塑科技有限公司',
				industry:'汽车零部件',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'•	保证生产绩效指标：生产总合格率：95%；一次合格率：85%；计划完成率100%；
				•	工艺管理：现行产品工艺批量事故为0；新产品工艺验证确立：组织试生产工艺文件编审批，下发试生产工艺文件；
				•	注塑工艺，喷涂工艺，组装装配工艺的监控与优化
				•	生产成本的标准制定，监控管理，cost down等
				•	设备快速换线，换模（SEMD）
				•	整个生产流程优化，采用一个流以及看板管理，降低库存。
				'}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'工业工程',
				degree:'本科',
				school:'西安交通大学'}}
)
k=User.new(
  title:		'品保经理',
  city:			'上海',
  id:			10010,
  mobile:		13916310010,
  user_name:		'吴先生',
  true_name:		'吴先生',
  :avatar => File.open(File.join(Rails.root, 'app', 'assets','images','wxs.png')),
  email:		'wxs@test.com',
  password:		'11111111',
  password_confirmation:'11111111',
  user_type:		'求职者',
  base_salary:		'10000',
  month_num:		'13',
  bonus:		'50000',
  housing:		'10200',
  transport:		'56000',
  birthday:		'1978-9-11',
  stock:		'股票',
  stock_num:		'1000',
  summaries_attributes:	{first:{content:'对生物发酵技术、药业GMP有一定的基础和掌握； 
	  熟悉质量管理体系ISO9001、ISO22000、HACCP、BRC、IFS、AIB标准，熟悉GMP、SSOP；
	  熟悉QS和出口食品卫生注册申请要求，能够帮助企业办理QS和卫生注册申请工作。
	  能够独立指导企业进行质量体系认证，帮助企业建立、制定和维护质量管理体系。
	  '}},
  works_attributes:	{first: {title:'品保经理',
	  			employer:'上海小南国餐饮管理有限公司',
				industry:'餐饮',
				join_date:'2000-9-01',
				leave_date:'2010-8-31',
				job_scope:'1、负责中央工厂（厨房）年度工作计划的制定和组织实施；
				2、负责中央厨房质量体系的建立、维护、更新工作，定期报告质量体系的运行情况；
				3、负责部门内部人员的工作安排及监督部门人员的工作；
				'}},
  educations_attributes:{first: {enter_school:'1997-9-1',
	  			leave_school:'2001-9-1',
				major:'法学硕士',
				degree:'本科',
				school:'南京大学'}}
)
a.skip_confirmation!
b.skip_confirmation!
c.skip_confirmation!
d.skip_confirmation!
e.skip_confirmation!
f.skip_confirmation!
g.skip_confirmation!
h.skip_confirmation!
i.skip_confirmation!
j.skip_confirmation!
k.skip_confirmation!

a.save!
b.save!
c.save!
d.save!
e.save!
f.save!
g.save!
h.save!
i.save!
j.save!
k.save!

