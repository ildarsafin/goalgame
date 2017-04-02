class Goal < ApplicationRecord
  validates :description, presence: true, allow_blank: false
  validates :picture, presence: true

  scope :active, -> { where(cancelled_at: nil, actually_achieved_at: nil) }
  scope :achieved, -> { where.not(actually_achieved_at: nil) }
  scope :cancelled, -> { where.not(cancelled_at: nil) }

  belongs_to :user
  has_many :daily_reports, -> { order(created_at: :desc) }
  has_many :goal_steps, -> { order(position: :asc) }

  mount_uploader :picture, PictureUploader

  acts_as_list scope: :user

  accepts_nested_attributes_for :goal_steps
end
