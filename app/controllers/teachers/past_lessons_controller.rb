class Teachers::PastLessonsController < ApplicationController
  def index
    @lessons = current_teacher.lessons.past.desc.page(params[:page])
  end

  def show
    @lesson = current_teacher.lessons.find(params[:id])
  end
end
