class DashboardsController < ApplicationController
  def index
    @goals = current_user.goals.active.last(5)
  end
end
