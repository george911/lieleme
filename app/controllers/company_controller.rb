class CompanyController < ApplicationController
  skip_before_action :authenticate_user!
# 自动render company.html.erb如果出现的话
  before_action :prepare_for_mobile
  layout "side1", except: [:about_us]
  def about_us
    respond_to do |format|
      format.html { render "about_us" }
      format.mobile
    end
  end

  def share_policy
  end 


    
  end
