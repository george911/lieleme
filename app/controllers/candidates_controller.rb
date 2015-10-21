class CandidatesController < InheritedResources::Base
  def mail_history
  end
  
  def group_email
    @candidates = current_user.candidates.all
    @candidates = @current_user.candidates.where(name:params[:name]) unless params[:name].blank?
    @candidates = @current_user.candidates.where(email:params[:email]) unless params[:email].blank?
    @candidates = @candidates.where(title:params[:title]) unless params[:title].blank?
    @candidates = @candidates.where("year >= ?",params[:year]) unless params[:year].blank?
    @candidates = @candidates.where(city:params[:city]) unless params[:city].blank?
    @candidates = @candidates.where(employer:params[:employer]) unless params[:employer].blank?
    @candidates = @candidates.where("id > 2379")
    @candidates.each do |f|
      sleep 40
      JobNotifier.job_list(f,params[:job_id],params[:content],current_user).deliver_now
    end
    current_user.mail_histories.create(email:params[:email],name:params[:name],title:params[:title],year:params[:year],city:params[:city],employer:params[:employer],job_id:params[:job_id])
    @candidates = @candidates.page(params[:page]).per(100)
    respond_to do |format|
      	  format.html { render :index }
      	  format.js { flash[:notice] = "群发邮件发送成功" }
    	end
  end

  def index
    @candidate = Candidate.new
    @candidates= current_user.candidates.all.page(params[:page]).per(100)
  end

  def search
    candidates = current_user.candidates.all
    candidates = current_user.candidates.where(name:params[:name]) unless params[:name].blank?
    candidates = current_user.candidates.where(email:params[:email]) unless params[:email].blank?
    candidates = candidates.where(title:params[:title]) unless params[:title].blank?
    candidates = candidates.where("age >= ?",params[:min_age]) unless params[:min_age].blank?
    candidates = candidates.where("age <= ?",params[:max_age]) unless params[:max_age].blank?
    candidates = candidates.where(city:params[:city]) unless params[:city].blank?
    candidates = candidates.where(employer:params[:employer]) unless params[:employer].blank?
    @candidates = candidates.page(params[:page]).per(100)
    render 'candidates/index'
  end

  def edit
    @candidate = Candidate.find(params[:id])
    respond_to do |format|
	format.html 
	format.js
	end
  end
 
  def update
    @candidate = current_user.candidates.find(params[:id])
    respond_to do |format|
	if @candidate.update(candidate_params)
	  format.html { redirect_to candidates_path }
	  format.js
	else
		format.html { render :edit }
		format.js
	end
    end
  end


  def create
    @candidate = current_user.candidates.build(city:params[:city],age:params[:age],name:params[:name],title:params[:title],employer:params[:employer],mobile:params[:mobile],email:params[:email],note:params[:note])
    respond_to do |format|
      if current_user.candidates.find_by email: params[:email]
	@candidate = current_user.candidates.find_by email: params[:email]
    	@candidate.update(name:params[:name],title:params[:title],city:params[:city],employer:params[:employer],mobile:params[:mobile],email:params[:email],note:params[:note],age:params[:age])
	@candidate.save
	@candidates = current_user.candidates.page(params[:page]).per(100)
	format.html { redirect_to candidates_path }
	format.js
      else
	if @candidate.save
	  @candidates = current_user.candidates.page(params[:page]).per(100) 
	  format.html { redirect_to candidates_path }
	  format.js
	else
	  format.html { render :new }
	end
      end
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    respond_to do |format|
	format.html { redirect_to candidates_url,notice: "记录已经删除" }
	format.js
    end
  end


  private

    def candidate_params
      params.require(:candidate).permit(:year,:age,:name, :title, :employer, :mobile, :email, :city, :note)
    end
end

