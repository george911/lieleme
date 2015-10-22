class ReferNotifier < ActionMailer::Base
  default from: "george.qiao@lieyohui.com"

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
  
end
