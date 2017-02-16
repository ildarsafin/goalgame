class UserPersona < ApplicationRecord
  belongs_to :user
  belongs_to :persona

  scope :active, -> { where(active: true) }
end

