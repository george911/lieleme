class RegistrationsController < Devise::RegistrationsController
  layout "signup_wizard"
  
  protected
  def after_sign_up_path_for(resource)
    if @user.user_type='求职者'
      after_signup_path(:summary)
    elsif @user.user_type='猎头'
      after_signup_path(:summary)
    end
  end

  def after_inactive_sign_up_path_for(resource)
    confirm_path(email:resource.email)
  end
end
