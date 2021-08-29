class Teachers::ReservedLessonsController < ApplicationController
  def index
    @lessons = current_teacher.lessons.reserved.future.desc.page(params[:page])
  end

  def show
    @lesson = current_teacher.lessons.find(params[:id])
  end
end
