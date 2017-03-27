class GoalStep < ApplicationRecord
  validates :description, presence: true, allow_blank: false

  acts_as_list scope: :goal
end
