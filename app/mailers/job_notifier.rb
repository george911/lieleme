class JobNotifier < ActionMailer::Base
  default from: "support@lieyohui.com"

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

    

