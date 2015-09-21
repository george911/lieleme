class BdEmail < ApplicationMailer
  def ruby(receiver)
    mail to: receiver,subject: "8000万"
  end
end
