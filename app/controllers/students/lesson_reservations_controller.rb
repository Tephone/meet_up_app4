class Students::LessonReservationsController < ApplicationController
  def create
    @lesson_reservation = current_student.lesson_reservations.new(lesson_reservation_params)
    if current_student.remaining_lesson_count <= 0
      redirect_to students_lessons_path, alert: 'チケットを購入してください'
    else
      @lesson_reservation.save!
      redirect_to students_reserved_lessons_path, notice: 'レッスンを予約しました'
    end
  end

  def destroy
    @lesson_reservation = current_student.lesson_reservations.find(params[:id])
    @lesson_reservation.destroy!
    redirect_to students_lessons_path, notice: 'レッスンを予約を解除しました'
  end

  private

  def lesson_reservation_params
    params.require(:lesson_reservation).permit %i[student_id lesson_id]
  end
end
