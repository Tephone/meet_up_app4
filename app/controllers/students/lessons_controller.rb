class Students::LessonsController < Students::ApplicationController
  def index
    @lessons = Lesson.not_reserved.future
    if params[:teacher_name].present?
      @lessons = @lessons.search_by_teacher_name(params[:teacher_name])
    end
    if params[:language_id].present?
      @lessons = @lessons.search_by_language_id(params[:language_id])
    end
    if params[:date].present?
      @lessons = @lessons.search_by_date(params[:date])
    end
    @lessons = @lessons.started_at_asc.page(params[:page])
  end
end
