class ClientsController < InheritedResources::Base
  def send_email
    #@clients = Client.where(industry:params[:industry])
    Client.all.each do |client|
      client.client_emails.each do |f|
	#sleep 20.seconds
	BdEmail.ruby(f.email).deliver_now
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def index
    @client=Client.new
    @clients = Client.all
  end

  def create
    @client = Client.new(name:params[:name],phone:params[:phone])
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

