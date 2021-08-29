class Students::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.not_reserved.future.page(params[:page])
  end
end
