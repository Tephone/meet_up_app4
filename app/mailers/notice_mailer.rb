class NoticeMailer < ApplicationMailer
  def reservation_notice_for_student(lesson_reservation)
    @lesson_reservation = lesson_reservation
    mail to: 'from@example.com', subject: '予約確認メール'
    # 本来lesson_reservation.student.email等で送信先は指定すべきですが、今回はlocalのみのため適当なアドレスを指定しました
  end

  def reservation_notice_for_teacher(lesson_reservation)
    @lesson_reservation = lesson_reservation
    mail to: 'from@example.com', subject: '予約受付メール'
    # 本来lesson_reservation.lesson.teacher.email等で送信先は指定すべきですが、今回はlocalのみのため適当なアドレスを指定しました
  end
end
