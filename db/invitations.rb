job1 = Job.find(10001)
job2 = Job.find(10002)
job3 = Job.find(10003)
job4 = Job.find(10004)
job5 = Job.find(10005)
job6 = Job.find(10006)
job7 = Job.find(10007)

Invitation.create(
  recipient_id:	20002,
  sender_id:	10000,
  job_id:	"10001",
  accept:	true,
  job_title:	"#{job1.employer}_#{job1.title}",
  job_employer:	"猎友会")
Invitation.create(
  recipient_id:	20001,
  sender_id:	10000,
  job_id:	10002,
  accept:	true,
  job_title:	"#{job2.employer}_#{job2.title}",
  job_employer:	"猎友会")
Invitation.create(
  recipient_id:	20002,
  sender_id:    10000,	
  job_id: 	10003,
  job_title:	"#{job3.employer}_#{job3.title}",
  job_employer:	"猎友会")
Invitation.create(
  recipient_id: 20002,	
  sender_id:    10000,	
  job_id: 	10004,
  job_title:	"#{job4.employer}_#{job4.title}",
  job_employer:	"猎友会")
Invitation.create(
  recipient_id: 20002,	
  sender_id:	10000,	
  job_id:	10005,
  job_title:	"#{job5.employer}_#{job5.title}")
Invitation.create(
  recipient_id:	20002,	
  sender_id:	10000,	
  job_id:	10006,
  job_title:	"#{job6.employer}_#{job6.title}")
Invitation.create(
  recipient_id:	20002,	
  sender_id:	10000,	
  job_id:	10007,
  job_title:	"#{job7.employer}_#{job7.title}")

