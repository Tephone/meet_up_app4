class TeachersController < Teachers::ApplicationController
  before_action :authenticate_teacher!

  def show
    @teacher = current_teacher
  end
end
