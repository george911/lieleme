class CandidatesController < InheritedResources::Base
rescue_from Net::SMTPFatalError, with: :frequency_limited
autocomplete :candidate,:title,full:true,limit:10,:scopes=>[:unique_title]

  def mail_history
  end
  
  def group_email
    session[:sent_num]= 0
    session[:stop_id] = nil
    @candidates = current_user.candidates
    #@candidates = @current_user.candidates.where(name:params[:name]) unless params[:name].blank?
    #@candidates = @current_user.candidates.where(email:params[:email]) unless params[:email].blank?
    ##邮件要精确发送，不带Regex
    #@candidates = @candidates.where(title:params[:title]) unless params[:title].blank?
    #@candidates = @candidates.where("year >= ?",params[:year]) unless params[:year].blank?
    #@candidates = @candidates.where(city:params[:city]) unless params[:city].blank?
    #@candidates = @candidates.where(employer:params[:employer]) unless params[:employer].blank?
    @candidates = @candidates.where("id > 16675")

    @candidates.each_with_index do |f,u|
      if params[:all_over] == "true" 
	job_pool = Job.where("created_at >= ?",Time.now.days_ago(14)) 
      else 
	job_pool = Job.where("created_at >= ?",Time.now.days_ago(14)).where(city:f.city)
      end
      job_pool.each do |job|
	puts "职位名称#{job.title}"
	puts "职位tag#{job.tag1}#{job.tag2}#{job.tag3}"
	puts "候选人的方向#{f.title}"
      end
      job_pool.each do |job|
        if f.notified_jobs.where(job_id:job.id).empty?  and (f.updated_at < Time.now.days_ago(1))#该名候选人没有发送过这个职位并且发送职位间隔大于2天
          if (job.tag1 == f.title or job.tag2 == f.title or job.tag3 == f.title
         # if (job.tag1 == f.title or job.tag2 == f.title or job.tag3 == f.title or
	 #     job.tag1 == f.tag1 or job.tag2 == f.tag1 or job.tag3 == f.tag1 or
	 #     job.tag1 == f.tag2 or job.tag2 == f.tag2 or job.tag3 == f.tag2 or
	 #     job.tag1 == f.tag3 or job.tag2 == f.tag3 or job.tag3 == f.tag3
	     ) and (f.base_salary.nil? || job.base_pay.nil? || f.base_salary <= job.base_pay || job.base_pay == 0 || f.base_salary == 0 )
            JobNotifier.job_list(f,job.id,params[:content],current_user,params[:subject]).deliver_now
            current_user.mail_histories.create(candidate_id:f.id,total_num:@candidates.size,sent_num:session[:sent_num],content:params[:content],job_id:job.id,name:f.name,title:f.title,city:f.city)
	    f.touch # 该候选人这次将不能再发邮件
            session[:sent_num] += 1
            session[:stop_id]= f.id
            f.notified_jobs.create(job_id:job.id)
	    # MailSummary是为了统计每个城市每个职位是否发过职位,发过职位变色
	    if MailSummary.where("title LIKE ? and city LIKE ?",f.title,f.city).present?
	      MailSummary.where("title LIKE ? and city LIKE ?",f.title,f.city).each do |f|
		      f.touch
	      end
	    end
            sleep 55
          end
        end
      end
    end

    current_user.mail_histories.create(total_num:@candidates.size,sent_num:session[:sent_num],content:params[:content],status:"发送全部#{session[:sent_num]}封邮件",
      content:params[:content])
    flash[:notice]="发送了#{session[:sent_num]}封邮件"
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
    candidates = candidates.where("title like ?","%#{params[:title]}%") unless params[:title].blank?
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
	  if MailSummary.where("city LIKE ? and title LIKE ?",@candidate.city,@candidate.title).empty?
	    MailSummary.create(city:@candidate.city,title:@candidate.title)
	  end
	if @candidate.save
	  @candidates = current_user.candidates.page(params[:page]).per(100) 
	  # 产生相应邮件-人才-地域分布
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
    def frequency_limited
      current_user.mail_histories.create(total_num:@candidates.size,sent_num:session[:sent_num],status:"发送到#{session[:stop_id]}终止",content:params[:content],email:params[:email],name:params[:name],title:params[:title],year:params[:year],city:params[:city],employer:params[:employer],job_id:params[:job_id])
      flash[:notice] = "发送到id#{session[:stop_id]},总共#{session[:sent_num]}封邮件"
      @candidates = Candidate.where(id:session[:stop_id]).page(params[:page]).per(100)
      render :index
    end

    def candidate_params
      params.require(:candidate).permit(:tag1,:tag2,:tag3,:base_salary,:year,:age,:name, :title, :employer, :mobile, :email, :city, :note)
    end
end
