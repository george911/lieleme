class RoomsController < InheritedResources::Base
before_action :set_job

  def show
  end
    
  def create
  end
  private
    def set_job
      @job=Job.find(1041)
    end

    def room_params
      params.require(:room).permit()
    end
end

