class Admins::TeacherSessionsController < ApplicationController
  def create
    teacher = Teacher.find(params[:teacher])
    sign_in teacher
    redirect_to teacher_path(teacher)
  end
end
