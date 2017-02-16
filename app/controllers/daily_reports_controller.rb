class DailyReportsController < ApplicationController
  def index
    @daily_reports = current_user.daily_reports
  end

  def new
    @daily_report = DailyReport.new
  end

  def create
    if current_user.daily_reports.today_reports.empty?
      current_user.daily_reports.build(daily_report_params)

      current_user.account.coins += 10
      current_user.profile.activity_points += 10

      current_user.save

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
