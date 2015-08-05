class CompanyController < ApplicationController
  skip_before_action :authenticate_user!

  def about_us
    render "about_us"
  end

  def share_policy
  end 
    
  end
