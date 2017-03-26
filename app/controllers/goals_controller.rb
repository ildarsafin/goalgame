class GoalsController < ApplicationController
  def index
    @goals = current_user.goals.active
    @achieved_goals = current_user.goals.achieved
    @cancelled_goals = current_user.goals.cancelled
  end

  def new
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = current_user.goals.build(goal_params)
    @goal.start_at = DateTime.now

    if @goal.save
      flash[:success] = "Вы успешно создали цель!"

      current_user.account.coins += 10
      current_user.profile.activity_points += 10

      current_user.save

      redirect_to dashboards_url
    else
      render :new
    end
  end

  def done
    @goal = Goal.find(params[:goal_id])
    @goal.update_attributes(
      actually_achieved_at: DateTime.now
    )

    redirect_to dashboards_url
  end

  def cancel
    @goal = Goal.find(params[:goal_id])
    @goal.update_attributes(cancelled_at: DateTime.now)

    redirect_to dashboards_url
  end

  private

  def goal_params
    params.require(:goal).permit(:id, :description, :planned_achieve_at, :picture, goal_steps_attributes: [:id, :description, :_destroy])
  end
end
