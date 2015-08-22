class HomeController < ApplicationController
  before_action :authenticate_user!
#  rescue_from "ActiveRecord::RecordNotFound", with: :deny_empty
  layout "home"
  require 'date'

  def email_multiple
    @my_talents = User.find(params[:my_talent_ids])
  end
  
  def send_email
    @my_talents = User.find(params[:my_talent_ids])
    @my_talents.each do |f|
      # 调用app/jobs下面MassEmailJob类, 参数对应传递,启动background job的步骤
      # RAILS_ENV=production rake environment resque:work QUEUE=*&		建立queue
      # RAILS_ENV=production rake environment resque:scheduler&		启动scheduler
      # redis-server							启动redis server
       MassEmailJob.new(params[:subject],params[:content],f.email).enqueue(wait: 1.minute)
      # MyTalentMailer.talent_mail(params[:subject],params[:content],f.email).deliver_later(wait:1.minutes)
    end
    redirect_to my_talents_path 
  end
       
  def my_savings
    if current_user.present?
      @jobs = current_user.saved_jobs.page(params[:page]).per(10)
    end
  end
  
  def my_apply
    if current_user.present?
      @my_apply = current_user.received_line_items.where.not(status:"等待应聘").page(params[:page]).per(5)
      end
    end
  
  def job_invites
    if current_user.present?
      @job_invites = current_user.received_line_items.page(params[:page]).per(5)
    end
  end

  def my_interviews
    if current_user.user_type == "求职者"
      @my_interviews = current_user.received_interviews
    else
      @my_interviews = current_user.sent_interviews
    end
    @my_jobs = current_user.received_invitations.where(accept:true)
  end

  def my_invites
    @line_item = LineItem.new # form_for @line_item要用
    @my_invites = current_user.received_invitations.where("accept IS NULL or accept",true).where(status:"active")
#    @pending_invites = current_user.received_invitations.where(accept:nil) 放到layout里面去了
  end

  def pending_invites
    @line_item = LineItem.new
    @my_invites = current_user.received_invitations.where(status:"pending").where("accept IS NULL or accept",true)
    render 'my_invites'
  end

  def closed_invites
    @line_item = LineItem.new # form_for @line_item要用
    @my_invites = current_user.received_invitations.where(status:"closed").where("accept IS NULL or accept",true)
    render 'my_invites'
  end 
    
    def my_talents
    #@my_talents = User.where(bank_id: current_user.id)
      @my_talents = current_user.received_users.page(params[:page]).per(10)
      #@review = Review.new
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
    if params[:my_query].present?
      params[:my_query].split(/ /).each do |f|
	@my_line_items = current_user.sent_line_items.joins(:job,:recipient).uniq.where('users.user_name LIKE ? OR line_items.status LIKE ? OR jobs.employer LIKE ? OR jobs.title LIKE ?',"%#{f}%","%#{f}%","%#{f}%","%#{f}%").page(params[:page]).per(10)
      end
    else
      @my_line_items = current_user.sent_line_items.page(params[:page]).per(10)
    end
  end

  def my_referals
    @my_referals = current_user.sent_line_items.where(job_id: params[:job_id])
    render "my_referals"
  end

  # 我的active职位
  def my_jobs
    @title = "我进行中的职位"
    @my_jobs = current_user.jobs.where(status:"active") # default active
  end

  # 我的关闭的职位
  def my_closed_jobs
    @title = "我已经关闭的职位"
    @my_jobs = current_user.jobs.where(status:"closed")
    render 'my_jobs'
    end
  
  def my_pending_jobs
    @title = "我暂停的职位"
    @my_jobs = current_user.jobs.where(status:'pending')
    render 'my_jobs'
  end

  def close_job
    @job = Job.find(params[:job_id])
    @job.update(status:"closed")
    :q
    :q
    current_user.microposts.create(content:"我关闭了#{@job.title}职位",job_id:@job.id)
    @job.recipients.each do |f|
      JobNotifier.closed(f,@job).deliver_now
    end 
    redirect_to my_jobs_path
  end

  def pending_job
    @job = Job.find(params[:job_id])
    @job.update(status:"pending")
    @job.recipients.each do |f|
      JobNotifier.pending(f,@job).deliver_now
    end
    redirect_to my_jobs_path
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

