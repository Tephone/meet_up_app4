class PurchaseTicket < ApplicationRecord
  belongs_to :ticket
  belongs_to :student
  validates :ticket_id, presence: true

  scope :valid, -> { where(deadline: Date.current..) }
end
