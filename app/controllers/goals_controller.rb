class GoalsController < ApplicationController
  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.build(goal_params)
    @goal.status = 0
    @goal.start_at = DateTime.now
    @goal.save
    redirect_to new_goal_url
  end

  private

  def goal_params
    params.require(:goal).permit(:id, :description, :planned_end_at, :activity_area)
  end
end
