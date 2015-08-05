#app/jobs/mass_email_job.rb

class MassEmailJob < ActiveJob::Base
  queue_as :email

    def perform(subject,content,address)
      MyTalentMailer.talent_mail(subject,content,address).deliver_now
    end

 end

