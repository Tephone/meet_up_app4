class Review < ApplicationRecord
  belongs_to :teacher
  belongs_to :lesson
  validates :content, presence: true
  validates :teacher_id, uniqueness: {scope: :lesson_id}
end
