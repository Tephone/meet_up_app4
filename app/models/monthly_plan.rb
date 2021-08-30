class MonthlyPlan < ApplicationRecord
  belongs_to :ticket
  has_many :choice_monthly_plans, dependent: :destroy
end
