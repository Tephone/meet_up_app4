class Teachers::PastLessonsController < Teachers::ApplicationController
  def index
    @lessons = current_teacher.lessons.reserved.past.started_at_desc.page(params[:page])
  end

  def show
    @lesson = current_teacher.lessons.find(params[:id])
  end
end
