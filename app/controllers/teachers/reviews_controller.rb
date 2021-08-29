class Teachers::ReviewsController < Teachers::ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def new
    @lesson = current_teacher.lessons.find(params[:lesson])
    @review = current_teacher.reviews.new(lesson_id: @lesson.id)
  end

  def create
    @review = current_teacher.reviews.new(review_params)
    if @review.save
      redirect_to teachers_past_lessons_path, notice: 'レビューしました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to teachers_review_path(@review), notice: 'レビューを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy!
    redirect_to teachers_past_lessons_path, notice: 'レビューを削除しました'
  end

  private

  def review_params
    params.require(:review).permit %i[teacher_id lesson_id content]
  end

  def set_review
    @review = current_teacher.reviews.find(params[:id])
  end
end
