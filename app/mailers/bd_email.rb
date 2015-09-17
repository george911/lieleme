class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "国内最权威的Ruby猎头公司"
  end
end
