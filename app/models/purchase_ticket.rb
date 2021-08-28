class PurchaseTicket < ApplicationRecord
  belongs_to :ticket
  belongs_to :student
end
