class JobNotifier < ActionMailer::Base
  default from: "mrjobs@lieleme.com"

  def job_list(candidate,job_id,content,sender,subject)
    @candidate = candidate
    @content = content
    if job_id.present?
	@job = Job.find(job_id) unless job_id == nil
    end
    @sender = sender
    delivery_options = { user_name: sender.email_account,
                         password: sender.email_password,
			 address: sender.email_address
			 
                        }

    mail to: candidate.email, from: sender.email_account, subject: "你好#{candidate.name},#{subject}",delivery_method_options: delivery_options
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

    

