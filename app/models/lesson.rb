class Lesson < ApplicationRecord
  belongs_to :teacher

  scope :future, -> {where('started_at >= ?', Time.current)}
  scope :past, -> {where('started_at < ?', Time.current)}
end
