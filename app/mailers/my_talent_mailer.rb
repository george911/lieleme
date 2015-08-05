class MyTalentMailer < ActionMailer::Base
  default from: "support@lieyohui.com"
  def talent_mail(subject,content,address)
    @content = content
    mail to: address,subject:subject
  end
end
