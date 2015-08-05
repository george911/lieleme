class InviteNotifier < ActionMailer::Base
  default from: "support@lieyohui.com"

  def invited(sender,recipient,job)
    @sender = sender
    @recipient = recipient
    @job = job
    mail to: recipient.email,subject:"你好#{recipient.user_name},#{sender.user_name}给您推荐一个职位",template_path: 'invite_notifier', template_name: 'invited'
  end
end

