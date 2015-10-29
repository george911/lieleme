class MyTalentMailer < ActionMailer::Base
  default from: "george@lieleme.com"
  def talent_mail(subject,content,address)
    @content = content
    mail to: address,subject:subject
  end
end
