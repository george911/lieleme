class ClientsController < InheritedResources::Base
  before_action :admin_verify
  def send_email
    #@clients = Client.where(industry:params[:industry])
    #@clients.each do |client|
    BdEmail.ruby(params[:email]).deliver_now
    # 测试
    #BdEmail.ruby("cvsend@139.com").deliver_now
    respond_to do |format|
      format.html { redirect_to clients_path,notice:"#{params[:email]}邮件发送成功" }
      format.js { flash[:notice]="#{params[:email]}邮件发送成功" }
    end
  end

  def delete_hr
    Hr.find(params[:id]).destroy
    Client.find_by(name:"我自己").touch unless Client.find_by(name:"我自己") == nil
    @clients=Client.all
    respond_to do |format|
      format.html { redirect_to clients_path, notice:"删除成功"}
      format.js 
    end
  end

  def bd_test
    BdEmail.ruby("743278938@139.com").deliver_now
    respond_to do |format|
      format.html { redirect_to clients_path,notice:"#{Time.now}测试邮件已经发出" }
    end
  end

  def index
    @client=Client.new
    @clients = Client.all
  end

  def create
    @client = Client.new(name:params[:name],industry:params[:industry],note:params[:note])
    respond_to do |format|
      if Client.find_by(name:params[:name])
        @client = Client.find_by(name:params[:name])
	#@client.client_emails.create(email:params[:email])
	@client.hrs.create(name:params[:hr_name],title:params[:hr_title],email:params[:hr_email],phone:params[:hr_phone])
        @client.touch
	@clients = Client.all
        format.html { redirect_to @client }
        format.js
      else
	if @client.save
	  #@email = @client.client_emails.create(email:params[:email])
	  @client.hrs.create(name:params[:hr_name],title:params[:hr_title],email:params[:hr_email],phone:params[:hr_phone])
    	  Client.find_by(name:"我自己").touch unless Client.find_by(name:"我自己") == nil
          @clients = Client.all
          format.html { redirect_to @client }
          format.js
        else
          format.html { render :new }
        end	
      end
    end
  end

  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
	format.html { redirect_to clients_path }
	format.js
      else
	format.html { render :new }
	format.js
      end
    end
  end

  private
    def admin_verify
      flash[:error]="您没有权限浏览这个页面"
      render 'errors/access_denied' unless admin?
    end

    def client_params
      params.require(:client).permit(:name, :phone, :email,:note)
    end
end

