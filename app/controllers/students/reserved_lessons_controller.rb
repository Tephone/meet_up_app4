class Students::ReservedLessonsController < Students::ApplicationController
  def index
    @lessons = current_student.lessons.future.started_at_asc.page(params[:id])
  end

  def show
    @lesson = current_student.lessons.find(params[:id])
  end
end
