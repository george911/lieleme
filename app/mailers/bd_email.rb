class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "放在掌心" 
  end
end
