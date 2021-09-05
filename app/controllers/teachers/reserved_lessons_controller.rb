class Teachers::ReservedLessonsController < ApplicationController
  def index
    @lessons = current_teacher.lessons.reserved.future.started_at_desc.page(params[:page])
  end

  def show
    @lesson = current_teacher.lessons.find(params[:id])
  end
end
