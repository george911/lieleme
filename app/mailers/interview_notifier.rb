class InterviewNotifier < ActionMailer::Base
  default from: "mrjobs@lieleme.com"

  def accepted(sender,recipient)
    @sender = sender
    @recipient = recipient
    mail to: recipient.email,subject:"你好#{recipient.user_name},#{sender.user_name}已经接受了您的面试邀请",template_path: 'interview_notifier', template_name: 'accepted'
  end
  def rejected(sender,recipient)
    @sender = sender
    @recipient = recipient
    mail to: recipient.email,subject:"你好#{recipient.user_name},#{sender.user_name}已经拒绝了您的面试邀请",template_path: 'interview_notifier', template_name: 'rejected'
  end
  def created(sender,recipient)
    @sender = sender
    @recipient = recipient
    mail to: recipient.email,subject:"你好#{recipient.user_name},#{sender.user_name}给您发出了面试邀请",template_path: 'interview_notifier', template_name: 'created'
  end
  def feedback(sender,recipient)
    @sender = sender
    @recipient = recipient
    mail to: recipient.email,subject:"你好#{recipient.user_name},#{sender.user_name}回复了您的面试邀请",template_path: 'interview_notifier', template_name: 'feedback'
  end
  def updated(sender,recipient)
    @sender = sender
    @recipient = recipient
    mail to: recipient.email,subject:"你好#{recipient.user_name},#{sender.user_name}更新了发给您的面试邀请",template_path: 'interview_notifier', template_name: 'updated'
  end
end

