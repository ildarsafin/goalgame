class DailyReport < ApplicationRecord
  belongs_to :user

  scope :today_reports, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
end
