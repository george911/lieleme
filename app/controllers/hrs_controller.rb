class HrsController < ApplicationController

  def update
    @hr = Hr.find(params[:id])
    respond_to do |format|
      if @hr.update(hr_params)
        format.html { redirect_to clients_path }
        format.js
      else
	format.html {  }
        format.json
      end
    end
  end

  private
    def hr_params
      params.require(:hr).permit(:name,:title,:phone,:email)
    end
end
