class DailyReportsController < ApplicationController
  def index
    @daily_reports = current_user.daily_reports
  end

  def new
    @daily_report = DailyReport.new
  end

  def create
    @daily_report = current_user.daily_reports.create(daily_report_params)
    redirect_to new_daily_report_url
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:id, :content)
  end
end
