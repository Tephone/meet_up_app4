class StudentsController < Students::ApplicationController
  before_action :authenticate_student!

  def show
    @student = current_student
  end
end
