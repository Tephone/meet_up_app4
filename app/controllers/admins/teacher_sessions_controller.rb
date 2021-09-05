class Admins::TeacherSessionsController < Admins::ApplicationController
  def create
    teacher = Teacher.find(params[:teacher_id])
    sign_in teacher
    redirect_to teacher_path(teacher)
  end
end
