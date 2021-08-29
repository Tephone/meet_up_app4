class Language < ApplicationRecord
  has_many :teachers, dependent: :restrict_with_exception
end
