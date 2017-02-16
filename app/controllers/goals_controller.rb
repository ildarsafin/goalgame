class GoalsController < ApplicationController
  def index
    @goals = current_user.goals.active
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goal_params)
    @goal.status = 0
    @goal.start_at = DateTime.now
    @goal.save
    flash[:success] = "Вы успешно создали цель!"

    current_user.account.coins += 10
    current_user.profile.activity_points += 10

    current_user.save

    redirect_to goals_url
  end

  def done
    @goal = Goal.find(params[:goal_id])
    @goal.update_attributes(
      status: Goal.statuses[:achieved],
      actually_end_at: DateTime.now
    )

    redirect_to goals_url
  end

  def cancel
    @goal = Goal.find(params[:goal_id])
    @goal.update_attributes(status: Goal.statuses[:cancelled])

    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:id, :description, :planned_end_at, :activity_area)
  end
end
