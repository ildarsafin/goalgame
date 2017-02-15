class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy

  has_many :goals, dependent: :destroy
  has_many :daily_reports, dependent: :destroy

  after_create :with_account
  after_initialize :set_profile

  accepts_nested_attributes_for :profile

  accepts_nested_attributes_for :goals

  private

  def with_account
    self.create_account!(coins: 0)
  end

  def set_profile
    build_profile unless profile
  end
end
