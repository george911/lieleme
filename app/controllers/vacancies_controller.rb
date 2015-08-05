class VacanciesController < ApplicationController
  layout :false
  def index
    @vacancies = Job.where(employer:"猎友会").page(params[:page]).per(10)
  
    end
end
