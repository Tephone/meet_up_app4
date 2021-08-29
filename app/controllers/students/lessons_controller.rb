class Students::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.not_reserved.future.asc.page(params[:page])
    if params[:teacher_name].present?
      @lessons = @lessons.joins(:teacher).search_by_teacher_name(params[:teacher_name]).asc.page(params[:id])
    end
    if params[:language_id].present?
      @lessons = @lessons.joins(teacher: :language).search_by_language_id(params[:language_id]).asc.page(params[:id])
    end
    if params[:date].present?
      @lessons = @lessons.search_by_date(params[:date]).asc.page(params[:id])
    end
  end
end
