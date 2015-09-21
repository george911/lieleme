class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "马夏尔"
  end
end
