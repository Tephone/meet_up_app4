class Admins::TeacherReservationRatesController < Admins::ApplicationController
  def show
    @teacher = Teacher.find(params[:teacher_id])
  end
end
