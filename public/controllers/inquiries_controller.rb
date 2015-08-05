class InquiriesController < InheritedResources::Base
  skip_before_action :authenticate_user!
  # 推荐候选人页面
  def new
    @inquiry=Inquiry.new()
  end

  def ourjobs
    @inquiry=Inquiry.new() # 不产生resource inquiry的object,layout里form_for(resource...会报错
    @jobs=Job.where(employer:"猎友会").page(params[:page]).per(10)
  end

  def create
    @inquiry=Inquiry.new(inquiry_params)
    respond_to do |format|
      if @inquiry.save
        InquiryNotifier.inquiry(@inquiry).deliver unless @inquiry.email==nil
        format.html { redirect_to @inquiry, notice: '您的信息已经发送' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def invest 
    @inquiry=Inquiry.new()
    render 'new'
  end

  private

    def inquiry_params
      params.require(:inquiry).permit(:name, :employer, :title, :inquiry_type, :mobile, :email, :content)
    end
end

