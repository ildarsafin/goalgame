class Order < ApplicationRecord
  belongs_to :user

  enum status: [ :created, :paid, :cancelled ]
end
