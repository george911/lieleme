class ReferNotifier < ActionMailer::Base
  default from: "george@lieleme.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.refer_notifier.refer.subject
  #
  def refer(line_item)
    @line_item = line_item
    @greeting = "Hi #{@line_item.name}"
    @job = Job.find(@line_item.job_id)

    mail to: line_item.email, subject:"Hi #{@line_item.name}, 猎友会给您推荐职位了", temlate_path: 'refer_notifier',template_name: 'refer'
  end

  def accept(line_item)
    @line_item = line_item
    @greeting = "Hi #{@line_item.sender.user_name}"
    mail to: line_item.sender.email, subject:"你好#{@line_item.sender.user_name},#{@line_item.recipient.user_name}接受了您的邀请"
  end
  
  def apply(line_item)
    @line_item = line_item
    @job = line_item.job
    @greeting = "Hi #{@job.poster.user_name}"
    mail to: @job.poster.email, subject:"你好#{@job.poster.user_name},#{@line_item.recipient.user_name}应聘了#{@job.title}职位"
  end
end
