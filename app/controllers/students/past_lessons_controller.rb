class Students::PastLessonsController < Students::ApplicationController
  def index
    @lessons = current_student.lessons.past.started_at_desc.page(params[:id])
  end
end
