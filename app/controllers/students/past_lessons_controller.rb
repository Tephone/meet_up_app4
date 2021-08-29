class Students::PastLessonsController < ApplicationController
  def index
    @lessons = current_student.lessons.past.page(params[:id])
  end
end
