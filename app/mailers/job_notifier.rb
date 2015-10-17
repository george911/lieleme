class JobNotifier < ActionMailer::Base
  default from: "george.qiao@lieyohui.com"

  def job_list(candidate,job_id,content,sender)
    @candidate = candidate
    @content = content
    @job = Job.find(job_id) 
    @sender = sender
    mail to: candidate.email, subject: "你好#{candidate.name}, 知道你已经忍受老板很久了"
  end

  def closed(recipient,job)
    @recipient=recipient
    @job = job
    mail to: recipient.email,subject:"您好,#{recipient.user_name},#{job.title}职位已经关闭了,希望你再接再厉",template_path:'job_notifier',template_name:'closed'
    end
  
  def pending(recipient,job)
    @recipient=recipient
    @job = job
    mail to: recipient.email,subject:"您好,#{recipient.user_name},#{job.title}职位暂停一会,希望你继续关注",template_path:'job_notifier',template_name:'pending'
    end
  end

    

