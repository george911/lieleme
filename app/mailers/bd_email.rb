class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "后来" 
  end
end
