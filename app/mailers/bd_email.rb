class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "天使"
  end
end
