class CheckUserReportJob < ActiveJob::Base
  RUN_EVERY = 1.hour

  def perform
    User.find_each do |user|
      if user.daily_reports.today_reports.empty?
      end
    end

    self.class.perform_later(wait_until: Date.tomorrow.noon)
  end
end
