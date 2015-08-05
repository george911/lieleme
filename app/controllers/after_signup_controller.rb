# AfterSignup
class AfterSignupController < ApplicationController
  include Wicked::Wizard
  layout "signup_wizard"
  steps :confirm, :summary, :education, :work, :salary, :invite
  skip_before_action :authenticate_user!,only: :confirm 
  # 放在这里可以共用layout以及背景色(在after_signup.scss里设置)
  def confirm
  end

  def show
    @user = current_user
    case step
    when :confirm
    when :summary
    when :education
    when :work 
    when :invite
      if current_user.mobile.present? and current_user.email.present?
	@line_items = LineItem.where("mobile = ? or email = ?",current_user.mobile,current_user.email)
      elsif current_user.mobile.present?
	@line_items = LineItem.where("mobile = ?",current_user.mobile)
      elsif current_user.email.present?
	@line_items = LineItem.where("email = ?",current_user.email)
      end

      @line_items.each do |f|
        f.recipient_id = current_user.id
	f.save
      end

      @invites = current_user.received_line_items.where(status:"等待应聘")

    end
    render_wizard # Renders the current step
  end

  def finish_wizard_path
    user_path(current_user) #最终回到users#create,@user.save保存
  end

  def update
     @user = current_user
     case step
     when :confirm
     when :summary
     when :education
     when :work
     end
     @user.update_attributes(user_params)
      sign_in(@user, bypass: true) # needed for devise
      render_wizard @user #存储成功进入下一步,否则返回
    end

  def user_params
    params.require(:user).permit(
      :tag_list,
      :avatar,
      :mobile, :user_name, :true_name, :user_type, :email, :birthday,
      :base_salary, :month_num, :bonus, :housing, :transport, :stock,:stock_num, 
    :retention_bonus, :expect_package, :expect_month_salary,
      :title,summaries_attributes: [:user_id, :content, :_destroy],
      educations_attributes: [:uptonow,:user_id, :school, :enter_school, :leave_school,
      :major, :degree, :_destroy],
      works_attributes: [:uptonow,:user_id, :title,:employer,:join_date,:leave_date,:industry, :job_scope, :_destroy]
     )
  end
end
