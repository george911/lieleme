class RoomsController < InheritedResources::Base
  before_action :set_room, only: :show
  layout :false, except: :new
  def new
    @room = Room.new
  end

  def show
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
	format.html { redirect_to room_path(@room,session_id:@room.session_id) }
      else
	render new
      end
    end
  end
  private
  def set_room
    @room = Room.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def room_params
    params.require(:room).permit(:session_id)
  end
end

