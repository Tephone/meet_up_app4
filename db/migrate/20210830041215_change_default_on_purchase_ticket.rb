class ChangeDefaultOnPurchaseTicket < ActiveRecord::Migration[6.1]
  def change
    change_column_default :purchase_tickets, :deadline, from: Date.current.since(1000.years), to: Float::INFINITY 
  end
end
