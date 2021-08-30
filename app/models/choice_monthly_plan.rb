class ChoiceMonthlyPlan < ApplicationRecord
  belongs_to :student
  belongs_to :monthly_plan
  validates :monthly_plan, presence: true
  validates :student_id, uniqueness: { scope: :monthly_plan_id }
end
