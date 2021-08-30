class ChoiceMonthlyPlan < ApplicationRecord
  belongs_to :student
  belongs_to :monthly_plan
  validates :monthly_plan, presence: true
  validates :student_id, uniqueness: { scope: :monthly_plan_id }

  def self.ticket_subscription
    self.all.find_each do |choice_monthly_plan|
      choice_monthly_plan.student.purchase_tickets.create!(ticket_id: choice_monthly_plan.monthly_plan.ticket.id, deadline: Date.current.end_of_month)
    end
  end
end
