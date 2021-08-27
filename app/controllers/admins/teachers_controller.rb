class Admins::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admins_teachers_path, notice: '講師を作成しました'
    else
      render :new
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.destroy!
    redirect_to admins_teachers_path, notice: '講師を削除しました'
  end

  private

  def teacher_params
    params.require(:teacher).permit %i[email password password_confirmation]
  end
end
