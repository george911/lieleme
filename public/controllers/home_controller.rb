class HomeController < ApplicationController
  layout :determine_layout
  
  def my_talents
    @my_talents = User.where(bank_id: current_user.id)
    if params[:my_query].present?
      params[:my_query].split(/ /).each do |f|
        if f=~/大学/
	  @my_talents = @my_talents.joins(:educations).uniq.where('educations.school LIKE ?',"%#{f}%")
	elsif f=~/北京|上海|天津|深圳|重庆|哈尔滨|长春|沈阳|呼和浩特|石家庄|乌鲁木齐|兰州|西宁|西安|银川|郑州|济南|太原|合肥|武汉|长沙|南京|成都|贵阳|昆明|南宁|拉萨|杭州|南昌|广州|福州|台北|海口|香港|澳门|无锡|苏州/
	  @my_talents = @my_talents.where("city like ?",$&)
	elsif f=~/[0-9][0-9]/ or f=~/[0-9]/
    	  @my_talents = @my_talents.where('birthday <= ?',Date.today-$&.to_i.years)
	else
	  @my_talents = @my_talents.joins(:works,:summaries).uniq.where('true_name LIKE ? OR user_name LIKE ? OR summaries.content LIKE ? OR works.title LIKE ? OR works.job_scope LIKE ? OR users.title LIKE ?',"%#{f}%","%#{f}%","%#{f}%","%#{f}%","%#{f}%","%#{f}%") # 搜索自我介绍、每段经历的title、job_scope和现在的title
	end
       end
    # 不用添加 my_talents.js 行
    end
  end

  # 我推荐的候选人
  def my_line_items
    @my_line_items = current_user.line_items.where(user_id: current_user.id)
    if params[:my_query].present?
      params[:my_query].split(/ /).each do |f|
	@my_line_items = @my_line_items.where('name LIKE ? OR status LIKE ? OR title LIKE ?',"%#{f}%","%#{f}%","%#{f}%")
      end
    end
  end

  # 我发布的职位
  def my_jobs
    @my_jobs = current_user.jobs
    if params[:my_query].present?
      params[:my_query].split(/ /).each do |f|
	@my_jobs = @my_jobs.where('title LIKE ? OR employer LIKE ? OR status LIKE ?',"%#{f}%","%#{f}%","%#{f}%")
      end
    end
end
  private
  def determine_layout
    case action_name
    when "my_jobs"
  	"home_jobs"
    else 
	"home"
  end
  end
end

