namespace :monthly_task do
  desc '定期プランでチケットを購入する処理'

  task ticket_subscription: :environment do
    if Date.current == Date.current.beginning_of_month
      ChoiceMonthlyPlan.ticket_subscription
    end
  end
end
