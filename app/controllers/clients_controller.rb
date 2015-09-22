class ClientsController < InheritedResources::Base
  def send_email
    #@clients = Client.where(industry:params[:industry])
    #@clients.each do |client|
      @client = Client.find(params[:id])
      @client.client_emails.each do |f|
	BdEmail.ruby(f.email).deliver_now
      end
    # 测试
    #BdEmail.ruby("cvsend@139.com").deliver_now
    respond_to do |format|
      format.html { redirect_to clients_path,notice:"#{@client.name}邮件发送成功" }
      format.js { notice:"#{@client.name}邮件发送成功" }
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
    @client = Client.new(name:params[:name],industry:params[:industry],phone:params[:phone])
    respond_to do |format|
      if Client.find_by(name:params[:name])
        @client = Client.find_by(name:params[:name])
	@client.client_emails.create(email:params[:email])
        @client.touch
	@clients = Client.all
        format.html { redirect_to @client }
        format.js
      else
	if @client.save
          @email = @client.client_emails.create(email:params[:email])
          @clients = Client.all
          format.html { redirect_to @client }
          format.js
        else
          format.html { render :new }
        end	
      end
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :phone, :email)
    end
end

