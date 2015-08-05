class InterviewsController < ApplicationController
  before_action :set_user, except: [:accept,:reject]
  before_action :authenticate_user!
  before_action :set_interview, except: [:new,:create]
  def new
    @interview = Interview.new
    @my_jobs = current_user.received_invitations.where(accept:true)
  end

  def accept
    mail_recipient = User.find(@interview.sender_id)
    @interview.update(accept: true)
    current_user.received_line_items.where(sender:@interview.sender).each do |f|
	f.update(interviewed:true)
    end

    InterviewNotifier.accepted(current_user,mail_recipient).deliver_now
    respond_to do |format|
    format.js
    end
  end

  def reject
    recipient = User.find(@interview.sender_id)
    @interview.update(accept: false)
    InterviewNotifier.rejected(current_user,recipient).deliver_now
    respond_to do |format|
    format.js
    end
  end
  
  def create
    recipient = User.find(params[:user_id])
    @interview = Interview.new(interview_params)
    @interview.recipient_id = params[:user_id]
    @interview.sender_id = current_user.id
    if @interview.content == "建立初步了解"
      @interview.job_id = nil
    end
    @interview.save
    InterviewNotifier.created(current_user,recipient).deliver_now
    redirect_to @user
  end
 
  def edit
    @my_jobs = current_user.received_invitations.where(accept:true) # 为了下拉菜单选择推荐的职位
    @user = User.find(params[:user_id])
    @interview = Interview.find(params[:id])      
  end

  def update
    @interview.update(interview_params)
    if @interview.content == "建立初步了解"
      @interview.job_id = nil
    end
      @interview.save
    if current_user.user_type == "求职者"
	recipient = User.find(@interview.sender_id) # 通知猎头有反馈
	InterviewNotifier.feedback(current_user,recipient).deliver_now
    else
	recipient = User.find(@interview.recipient_id) # 通知求职者发了面试邀请
	InterviewNotifier.updated(current_user,recipient).deliver_now
	end
    respond_to do |format|
      format.html { redirect_to my_interviews_path }
      format.js
    end
  end

  private 
  def find_title
    Job.find(job_id).title
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def set_user
    @user=User.find(params[:user_id])
  end

  def interview_params
  params.require(:interview).permit(
	:feedback,:job_id,:sender_id,:content,:accept,:datetime,:address)
  end
end
