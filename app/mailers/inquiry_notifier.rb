class InquiryNotifier < ActionMailer::Base
  default from: "george@lieleme.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.refer_notifier.refer.subject
  #
  
  def inquiry(inquiry)
    @inquiry = inquiry
    @greeting = "咨询"

    mail to: "cvsend@139.com", subject:"有人咨询", temlate_path: 'refer_notifier',template_name: 'inquiry'
  end
end

