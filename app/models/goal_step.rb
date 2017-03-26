class GoalStep < ApplicationRecord
  acts_as_list scope: :goal
end
