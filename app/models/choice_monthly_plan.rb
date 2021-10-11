class ChoiceMonthlyPlan < ApplicationRecord
  belongs_to :student
  belongs_to :monthly_plan
  validates :student_id, uniqueness: { scope: :monthly_plan_id }

  class << self
    def ticket_subscription
      ApplicationRecord.transaction do
        self.find_each do |choice_monthly_plan|
          choice_monthly_plan.student.purchase_tickets.create!(ticket_id: choice_monthly_plan.monthly_plan.ticket.id, deadline: Date.current.end_of_month)
        end
      end
    end
  end
end
