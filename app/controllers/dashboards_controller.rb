class DashboardsController < ApplicationController
  def index
    @goals = current_user.goals.active
  end
end
