class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :in_this_month, ->(current_time) { where(created_at: current_time.all_month) }
end
