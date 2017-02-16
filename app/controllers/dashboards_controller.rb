class DashboardsController < ApplicationController
  def index
    @daily_reports = current_user.daily_reports.last(5)
    @goals = current_user.goals.last(5)
  end
end
