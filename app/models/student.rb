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

  after_create do
    ticket = Ticket.find_by(lesson_count: 1)
    self.purchase_tickets.create!(ticket_id: ticket.id)
  end

  def count_of_used_regular_ticket_by_month(date)
    this_month_monthly_plan_lesson_count = self.choice_monthly_plan.monthly_plan.ticket.lesson_count
    this_month_reserved_lesson_count = self.lessons.where(created_at: date.all_month).count
    difference = this_month_reserved_lesson_count - this_month_monthly_plan_lesson_count
    if difference >= 1
      difference
    else
      0
    end
  end

  # 書き方の参考としてコメントアウトで残します
  # def all_count_of_used_regular_ticket_except_this_month
  #   registered_date = self.created_at.to_date
  #   last_month = Date.current.last_month
  #   (registered_date..last_month).to_a.uniq { |date| [date.year, date.month]}.sum { |date| count_of_used_regular_ticket_by_month(date) }
  # end

  def all_count_of_used_regular_ticket_except_this_month
    month = self.created_at.beginning_of_month.to_date
    last_month = Date.current.beginning_of_month.prev_month
    count_of_used_regular_ticket = 0
    while month <= last_month
      count_of_used_regular_ticket += count_of_used_regular_ticket_by_month(month)
      month = month.next_month
    end
    count_of_used_regular_ticket
  end

  def this_month_remaining_lesson_count(current_time)
    # this_month_lesson_count = self.tickets.where(purchase_tickets: {id: PurchaseTicket.where(created_at: Date.current.all_month)}).sum(:lesson_count) 書き方の参考としてコメントアウトで残します
    this_month_lesson_count = self.tickets.merge(PurchaseTicket.in_this_month(current_time)).sum(:lesson_count) 
    this_month_reserved_lesson_count = self.lessons.in_this_month(current_time).count
    this_month_lesson_count - this_month_reserved_lesson_count
  end

  def remaining_lesson_count(current_time)
    regular_tickets_lesson_count_except_this_month = self.tickets.where(purchase_tickets: { id: PurchaseTicket.regular_ticket }).where.not(purchase_tickets: {id: PurchaseTicket.in_this_month(current_time) }).sum(:lesson_count)
    remaining_lesson_count_except_this_month = regular_tickets_lesson_count_except_this_month - self.all_count_of_used_regular_ticket_except_this_month
    remaining_lesson_count = remaining_lesson_count_except_this_month + self.this_month_remaining_lesson_count(current_time)
  end
end
