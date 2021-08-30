class Students::ChoiceMonthlyPlansController < Students::ApplicationController
  before_action :set_choice_monthly_plan, only: %i[show edit update destroy]
  
  def new
    @choice_monthly_plan = current_student.build_choice_monthly_plan
  end

  def create
    @choice_monthly_plan = current_student.build_choice_monthly_plan(choice_monthly_plan_params)
    if @choice_monthly_plan.save
      redirect_to student_path(current_student), notice: '月額定期プランに加入しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @choice_monthly_plan.update(choice_monthly_plan_params)
      redirect_to student_path(current_student), notice: '月額定期プランを変更しました'
    else
      render :edit
    end
  end

  def destroy
    @choice_monthly_plan.destroy!
    redirect_to student_path(current_student), notice: '月額定期プランを休止しました'
  end

  private

  def choice_monthly_plan_params
    params.require(:choice_monthly_plan).permit %i[student_id monthly_plan_id]
  end

  def set_choice_monthly_plan
    @choice_monthly_plan = current_student.choice_monthly_plan
  end
end
