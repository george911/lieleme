# AfterSignup
class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :confirm, :summary, :education, :work, :salary
  
  def show
    @user = current_user
    case step
    when :confirm
    when :summary
    when :education
    when :work
    end
    render_wizard # Renders the current step
  end

  def finish_wizard_path
    user_path(current_user) #最终回到users#create,@user.save保存
  end

    #render_wizard @user # Shows next_step if @user.save, otherwise renders

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
