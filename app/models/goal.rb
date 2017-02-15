class Goal < ApplicationRecord
  enum status: [ :active, :achieved, :cancelled ]
  enum activity_area: [ :professional, :mind, :relations, :happiness ]
end
