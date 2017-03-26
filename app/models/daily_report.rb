class DailyReport < ApplicationRecord
  scope :today_reports, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  belongs_to :user
  belongs_to :goal

  acts_as_list scope: :goal
end
