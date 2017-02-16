class DailyReportsController < ApplicationController
  def index
    @daily_reports = current_user.daily_reports
  end

  def new
    @daily_report = DailyReport.new
  end

  def create
    if current_user.daily_reports.today_reports.empty?
      current_user.daily_reports.create(daily_report_params)
      flash[:success] = "Вы успешно создали отчет!"
    else
      flash[:error] = "Вы уже писали отчет за сегодня"
    end

    redirect_to daily_reports_url
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:id, :content)
  end
end
