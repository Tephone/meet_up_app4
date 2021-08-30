class Teachers::MultipleLessonsController < Teachers::ApplicationController
  around_action :wrap_in_transaction, only: [:create]

  def new
  end

  def create
    started_at_ary = params[:time_range][:started_at].without("")
    if started_at_ary.present?
      started_at_ary.each do |started_at|
        current_teacher.lessons.create!(started_at: started_at)
      end
      redirect_to teachers_lessons_path, notice: 'レッスンを作成しました'
    else
      render :new
    end
  end

  private

  def wrap_in_transaction
    ActiveRecord::Base.transaction do
      yield
    end
  end
end
