class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_reservation, dependent: :destroy
  has_one :review, dependent: :destroy
  validates :started_at, presence: true
  validate :started_at_should_not_be_past

  scope :future, -> { where('started_at >= ?', Time.current) }
  scope :past, -> { where('started_at < ?', Time.current) }
  scope :reserved, -> { where(id: LessonReservation.select(:lesson_id)) }
  scope :not_reserved, -> { where.not(id: LessonReservation.select(:lesson_id)) }
  scope :search_by_teacher_name, ->(teacher_name) { joins(:teacher).where('teachers.name LIKE ?', "%#{teacher_name}%") }
  scope :search_by_language_id, ->(language_id) { joins(teacher: :language).where(languages: {id: language_id}) }
  scope :search_by_date, ->(date) { where(started_at: date.in_time_zone.all_day) }
  scope :started_at_asc, -> { order('started_at ASC') }
  scope :started_at_desc, -> { order('started_at DESC') }
  scope :for_month, ->(date) { where(started_at: date.in_time_zone.all_month) }
  scope :for_day, ->(date) { where(started_at: date.in_time_zone.all_day) }
  scope :for_language, ->(language) { where(teacher_id: language.teachers) }
  scope :for_time, ->(datetime) { where('? <= started_at AND started_at <= ?', datetime.in_time_zone.beginning_of_hour, datetime.in_time_zone.end_of_hour) }

  def started_at_should_not_be_past
    errors.add(:started_at, 'は現在以降の日時を指定してください') if self.started_at.past?
  end
end
