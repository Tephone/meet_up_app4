class Review < ApplicationRecord
  belongs_to :teacher
  belongs_to :lesson
  validates :content, presence: true
end
