# Preview all emails at http://localhost:3000/rails/mailers/refer_notifier
class ReferNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/refer_notifier/refer
  def refer
    ReferNotifier.refer
  end

end
