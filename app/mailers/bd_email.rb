class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "国内最权威的Ruby人才库"
  end
end
