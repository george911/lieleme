class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "换个标题" 
  end
end
