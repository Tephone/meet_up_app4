class Ticket < ApplicationRecord
  has_one :monthly_plan, dependent: :destroy
end
