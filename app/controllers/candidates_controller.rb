class CandidatesController < InheritedResources::Base
  def index
    @candidate = Candidate.new
    @candidates= current_user.candidates.all
  end
 
  def edit
    @candidate = Candidate.find(params[:id])
    respond_to do |format|
	format.html 
	format.js
	end
  end
 
  def update
    @candidate = Candidate.find(params[:id])
    respond_to do |format|
	if @candidate.update(candidate_params)
		format.html { redirect_to candidates_path }
	else
		format.html { render :edit }
	end
    end
  end


  def create
    @candidate = current_user.candidates.build(age:params[:age],name:params[:name],title:params[:title],employer:params[:employer],mobile:params[:mobile],email:params[:email],note:params[:note])
    respond_to do |format|
      if Candidate.find_by email: params[:email]
	@candidate = Candidate.find_by email: params[:email]
    	@candidate.update(name:params[:name],title:params[:title],employer:params[:employer],mobile:params[:mobile],email:params[:email],note:params[:note],age:params[:age])
	@candidate.save
	@candidates = current_user.candidates 
	format.html { redirect_to candidates_path }
	format.js
      else
	if @candidate.save
	  @candidates = current_user.candidates 
	  format.html { redirect_to candidates_path }
	  format.js
	else
	  format.html { render :new }
	end
      end
    end
  end

  private

    def candidate_params
      params.require(:candidate).permit(:age,:name, :title, :employer, :mobile, :email, :city, :note)
    end
end

