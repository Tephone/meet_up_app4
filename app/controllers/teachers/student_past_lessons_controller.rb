class Teachers::StudentPastLessonsController < Teachers::ApplicationController
  def index
    @student = Student.find(params[:student])
    @lessons = @student.lessons.reserved.past.page(params[:page])
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
