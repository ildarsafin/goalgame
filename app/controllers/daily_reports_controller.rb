class DailyReportsController < ApplicationController
  def new
    @daily_report = DailyReport.new
  end

  def create
    @goal = Goal.find(params[:goal_id])

    if @goal.daily_reports.today_reports.empty?
      @goal.daily_reports.build(daily_report_params)

      current_user.account.coins += 10
      current_user.profile.activity_points += 10

      current_user.save
      @goal.save

      flash[:success] = "Вы успешно создали отчет!"
    else
      flash[:error] = "Вы уже писали отчет за сегодня"
    end

    redirect_to goal_url(@goal)
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:id, :content)
  end
end
