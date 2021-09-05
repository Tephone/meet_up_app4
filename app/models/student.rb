class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchase_tickets, dependent: :destroy
  has_many :tickets, through: :purchase_tickets, source: :ticket
  has_many :lesson_reservations, dependent: :destroy
  has_many :lessons, through: :lesson_reservations, source: :lesson
  has_one :choice_monthly_plan, dependent: :destroy

  def remaining_lesson_count
    valid_ticket_ids = self.purchase_tickets.valid.select(:ticket_id)
    lesson_count = self.tickets.where(id: valid_ticket_ids).sum(:lesson_count)
    reserved_lesson_count = self.lessons.count
    lesson_count - reserved_lesson_count
  end
end
