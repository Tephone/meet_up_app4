class Students::ReservedLessonsController < Students::ApplicationController
  def index
    @lessons = current_student.lessons.future.asc.page(params[:id])
  end

  def show
    @lesson = current_student.lessons.find(params[:id])
  end
end
