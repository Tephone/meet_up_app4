class Students::PastLessonsController < Students::ApplicationController
  def index
    @lessons = current_student.lessons.past.desc.page(params[:id])
  end
end
