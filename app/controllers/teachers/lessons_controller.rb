class Teachers::LessonsController < Teachers::ApplicationController
  before_action :set_lesson, only: %i[show edit update destroy]

  def index
    @lessons = current_teacher.lessons.future.desc.page(params[:page])
  end

  def new
    @lesson = current_teacher.lessons.new
  end

  def create
    @lesson = current_teacher.lessons.new(lesson_params)
    if @lesson.save
      redirect_to teachers_lessons_path, notice: 'レッスンを作成しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to teachers_lesson_path(@lesson), notice: 'レッスンを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy!
    redirect_to teachers_lessons_path, notice: 'レッスンを削除しました'
  end

  private

  def lesson_params
    params.require(:lesson).permit %i[started_at content zoom_url teacher_id]
  end
  
  def set_lesson
    @lesson = current_teacher.lessons.find(params[:id])
  end
end
