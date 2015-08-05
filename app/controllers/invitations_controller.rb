class InvitationsController < ApplicationController
  before_action :set_job
  before_action :set_invite, except: [:create]
  
  def create
    recipient = User.find(params[:user_id])
    current_user.send_invitation(sender: current_user,recipient: recipient, job: @job,job_title:"#{@job.employer}_#{@job.title}")
    InviteNotifier.invited(current_user,recipient,@job).deliver_now
    respond_to do |format|
    format.js
    end
  end

  def accept
    @invite.update(accept: true)
    respond_to do |format|
    format.js
   end
  end

  def reject
    @invite.update(accept: false)
    respond_to do |format|
    format.js
    end
  end

  private
  def set_job
    @job=Job.find(params[:job_id])
  end

  def set_invite
    @invite = Invitation.find(params[:invite_id])
  end

end

