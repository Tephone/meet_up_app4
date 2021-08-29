class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation, dependent: :destroy

  scope :future, -> {where('started_at >= ?', Time.current)}
  scope :past, -> {where('started_at < ?', Time.current)}
  scope :reserved, -> {where(id: LessonReservation.select(:lesson_id))}
  scope :not_reserved, -> {where.not(id: LessonReservation.select(:lesson_id))}
end
