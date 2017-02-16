class Goal < ApplicationRecord
  enum status: [ :active, :achieved, :cancelled ]
  enum activity_area: [ :professional, :mind, :relations, :happiness ]

  scope :active, -> { where(status: Goal.statuses[:active]) }
  scope :achieved, -> { where(status: Goal.statuses[:achieved]) }
  scope :cancelled, -> { where(status: Goal.statuses[:cancelled]) }
end
