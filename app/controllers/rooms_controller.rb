class RoomsController < ApplicationController
before_filter :config_opentok,:except => [:index]
require "opentok"

def index
      @rooms = Room.order("created_at DESC")
      @new_room = Room.new
    end

  def create
      config_opentok
      session = @opentok.create_session 
      params[:room][:sessionID] = session.session_id
  
      @new_room = Room.new(room_params)
  
      respond_to do |format|
        if @new_room.save
          format.html { redirect_to("/party/"+@new_room.id.to_s) }
        else
          format.html { render :controller => 'rooms', :action => "index" }
	end
      end
  end

  def party
      @room = Room.find(params[:id])
      config_opentok
      @tok_token = @opentok.generate_token :session_id =>@room.sessionID 
      #@tok_token = session_id.generate_token
    end

  private
  def config_opentok
      if @opentok.nil?
        @opentok = OpenTok::OpenTok.new "45390222","96b1e19987ed8296f53159f8b9da78373952693f"
      end
  end

  def room_params
    params.require(:room).permit(:name,:sessionID)
  end
end
