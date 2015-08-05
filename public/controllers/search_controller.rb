class SearchController < ApplicationController
  skip_before_action :authenticate_user!,only: [:search,:general_search]
  def search
    case params[:q]
    when "人才","猎头"
      @users = general_search(params[:query],params[:q])
      render "users/index"
    when "职位"
      @jobs = general_search(params[:query],params[:q])
      render "jobs/index"
    else
      @users = general_search(nil,"猎头")
      render "users/index"
    end 
  end

  def job_search # 自动运行job_search.js.erb
    @talent = User.find(session[:talent_id]) # session[:talent_id]来自users_controller的refer method,代表正在寻找匹配职位的候选人id.
    jobs = Job.all # 这个jobs要在循环外定义,否则会不认
    
    # 筛选出候选人没有应聘过的职位
    line_items = LineItem.where(talent_id: session[:talent_id])
    line_items.each do |f|
      jobs = jobs.where.not(id:f.job_id)
    end

    if params[:query].present?
      params[:query].split(/ /).each do |f|
        if f=~/北京|上海|天津|深圳|重庆|哈尔滨|长春|沈阳|呼和浩特|石家庄|乌鲁木齐|兰州|西宁|西安|银川|郑州|济南|太原|合肥|武汉|长沙|南京|成都|贵阳|昆明|南宁|拉萨|杭州|南昌|广州|福州|台北|海口|香港|澳门|无锡|苏州/
	  jobs=jobs.where("city like ?",$&)
	elsif f=~/[0-9][0-9]/ or f=~/[0-9]/ # 搜索年龄
	  jobs=jobs.where('work_year >= ?',$&)
	else
	  jobs=jobs.where('title like ? or role like ? or requirement like ?',"%#{f}%","%#{f}%","%#{f}%") # 搜索职衔、职责和要求
	end
      end
    end
      @jobs=jobs.page(params[:page]).per(5)
      @users = nil 
      
  end
   
  def general_search(keywords,category)
    if keywords.present? and category == "职位"
      jobs = Job.all # 这个jobs要在循环外定义,否则会不认
      keywords.split(/ /).each do |f|
        if f=~/北京|上海|天津|深圳|重庆|哈尔滨|长春|沈阳|呼和浩特|石家庄|乌鲁木齐|兰州|西宁|西安|银川|郑州|济南|太原|合肥|武汉|长沙|南京|成都|贵阳|昆明|南宁|拉萨|杭州|南昌|广州|福州|台北|海口|香港|澳门|无锡|苏州/
	  jobs=jobs.where("city like ?",$&)
	elsif f=~/[0-9][0-9]/ or f=~/[0-9]/ # 搜索年龄
	  jobs=jobs.where('work_year >= ?',$&)
	else
	  jobs=jobs.where('title like ? or role like ? or requirement like ?',"%#{f}%","%#{f}%","%#{f}%") # 搜索职衔、职责和要求
	end
      end
      return jobs.page(params[:page]).per(10)

    elsif keywords.present? and category == "人才"
      users=User.where(user_type: "求职者")
      keywords.split(/ /).each do |f|
	    if f=~/大学/
	      users = users.joins(:educations).uniq.where('educations.school LIKE ?', "%#{f}%")
            elsif f=~/北京|上海|天津|深圳|重庆|哈尔滨|长春|沈阳|呼和浩特|石家庄|乌鲁木齐|兰州|西宁|西安|银川|郑州|济南|太原|合肥|武汉|长沙|南京|成都|贵阳|昆明|南宁|拉萨|杭州|南昌|广州|福州|台北|海口|香港|澳门|无锡|苏州/
              users=users.where("city like ?",$&)
            elsif f=~/[0-9][0-9]/ or f=~/[0-9]/
              users=users.where('birthday <= ?',Date.today-$&.to_i.years)
	    else
              users=users.joins(:works,:summaries).uniq.where('summaries.content LIKE ? OR works.title LIKE ? OR works.job_scope LIKE ? OR users.title LIKE ?',"%#{f}%","%#{f}%","%#{f}%","%#{f}%") # 搜索自我介绍、每段经历的title、job_scope和现在的title
            end
        end
        return users.page(params[:page]).per(10)
       
    elsif keywords.present? and category == "猎头"
      users = User.where(user_type: "猎头")
      keywords.split(/ /).each do |f|
        # 搜索猎头专注的行业和专注的职位
	users=users.where('industry LIKE ? OR focus_job1 LIKE ? OR focus_job2 LIKE ? OR focus_job3 LIKE ?',"%#{f}%","%#{f}%","%#{f}%","%#{f}%")
      end
      return users.page(params[:page]).per(10)

    # 如果关键字空着
    elsif category == "猎头"
      return User.where(user_type: "猎头").page(params[:page]).per(10)
    elsif category == "人才"
      return User.where(user_type: "求职者").page(params[:page]).per(10)
    else 
      return Job.all.page(params[:page]).per(10)
    end
  end
end
