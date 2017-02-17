class Order < ApplicationRecord
  belongs_to :user

  enum status: [ :created, :paid, :cancelled ]

  scope :paid, -> { where(status: Order.statuses[:paid]) }
end
