# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview
  def reservation_notice_for_student
    lesson_reservation = LessonReservation.last
    NoticeMailer.reservation_notice_for_student(lesson_reservation)
  end

  def reservation_notice_for_teacher
    lesson_reservation = LessonReservation.last
    NoticeMailer.reservation_notice_for_teacher(lesson_reservation)
  end
end
