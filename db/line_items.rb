# Rails工程师职位等待面试阶段
# title指的是job title

LineItem.create(
  name:			'Aaron Qin',
  email:		'aaronqin@test.com',
  recipient_id:		10001,
  sender_id:		20002,
  job_id:		10001,
  status:		'等待面试',
  mobile:		'13916310001',
  comment:		'duke干得不错'
			)
LineItem.create(
  name:			'马贵耀',
  email:		'mgy@test.com',
  recipient_id:		'10002',
  sender_id:		20001,# 宋优优
  job_id:		'10001',# 海上风机工程师
  status:		'等待应聘',
  mobile:		13916310002,
  comment:		'符合我们的要求'
  )

LineItem.create(
  name:			'储海春',
  email:		'chc@test.com',
  recipient_id:	 	10003,
  sender_id:		20001,
  job_id:		10001,
  status:		'offer',
  mobile:		13916310003,
  comment:		'正好缺人')

LineItem.create(
  name:			'朱明',
  email:		'zm@test.com',
  recipient_id:		10004,
  sender_id:		20002,
  job_id:		10002,
  status:		'offer',
  mobile:		13916310004,
  comment:		'还不错',
  interviewed:		true)
LineItem.create(
  name:			'佘俊芝',
  email:		'ytz@test.com',
  recipient_id:		10005,
  sender_id:		20003,
  job_id:		10003,
  status:		'offer',
  mobile:		'13916310006',
  comment:		'候选人的英语把关需要更严格一些,其他方面把握的还是比较准确的.',
  interviewed:		true)

LineItem.create(
  name:			'余婷章',
  email:		'ytz@test.com',
  recipient_id:		10006,
  sender_id:		20004,
  job_id:		10004,
  status:		'offer',
  mobile:		'13916310007',
  comment:		'大同对我们的要求了解的非常充分,我非常欣赏他的工作态度!')
LineItem.create(
  name:			'刘海健',
  email:		'lhj@test.com',
  recipient_id:		10007,
  sender_id:		20005,
  job_id:		10005,
  status:		'offer',
  mobile:		'13916310008',
  comment:		'Raymond这次的服务非常好,如果对候选人的沟通能力了解的更深一点就跟好了')

LineItem.create(
  name:			'代洪彪',
  email:		'dhb@test.com',
  recipient_id:		10009,
  sender_id:		20006,
  job_id:		10006,
  status:		'offer',
  mobile:		'13916310009',
  comment:		'千寻这次送的人质量非常高,相对于其他猎头,我更愿意下次和他合作')
LineItem.create(
  name:			"待定",
  email:		'huayijob@aliyun.com',
  sender_id:		20002,
  job_id:		10007,# 大客户经理
  status:		'等待应聘',
  mobile:		'13916310010'
)
