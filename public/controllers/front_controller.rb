class FrontController < ApplicationController
  skip_before_action :authenticate_user! #devise认证user
  def show
    @offers=LineItem.where("status = ?","offer")#where能够取出然后使用.each函数,find_by不能
  end
end
