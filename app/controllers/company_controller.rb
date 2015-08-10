class CompanyController < ApplicationController
  skip_before_action :authenticate_user!
# 自动render company.html.erb如果出现的话
  layout "side1", except: [:about_us]
  def about_us
    render "about_us"
  end

  def share_policy
  end 
    
  end
