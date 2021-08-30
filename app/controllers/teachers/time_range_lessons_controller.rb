class Teachers::TimeRangeLessonsController < Teachers::ApplicationController
  around_action :wrap_in_transaction, only: [:create]

  def new
  end

  def create
    date = params[:date].in_time_zone
    start_time = params[:start_time].to_i
    end_time = params[:end_time].to_i
    time_range = (start_time..end_time).to_a
    if date.blank? || time_range.blank?
      render :new
    else
      time_range.each do |time|
        current_teacher.lessons.create!(started_at: date + time.hours)
      end
      redirect_to teachers_lessons_path, notice: 'レッスンを作成しました'
    end
  end

  private

  def wrap_in_transaction(&block)
    ActiveRecord::Base.transaction(&block)
  end
end
