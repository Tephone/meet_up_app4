class Students::ReservedLessonsController < ApplicationController
  def index
    @lessons = current_student.lessons.future.page(params[:id])
  end

  def show
    @lesson = current_student.lessons.find(params[:id])
  end
end
