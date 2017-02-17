class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy

  has_many :user_personas, dependent: :destroy
  has_many :personas, through: :user_personas

  has_many :orders, dependent: :destroy

  scope :current_persona, -> { p = user_personas.active.first; p.persona }

  has_one :laziness, dependent: :destroy

  has_many :goals, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :daily_reports, -> { order(created_at: :desc) }, dependent: :destroy

  after_create :with_account
  after_create :with_laziness
  after_create :with_persona

  after_initialize :set_profile

  accepts_nested_attributes_for :account
  accepts_nested_attributes_for :profile

  accepts_nested_attributes_for :goals

  def paid?
    orders.paid.present? && orders.paid.last.created_at < Time.zone.now + 30.days
  end

  def subscription_end_at_days
    return 0 unless paid?
    (orders.paid.last.created_at.to_i - Time.zone.now.to_i).days
  end

  private

  def with_laziness
    self.create_laziness!(points: 0)
  end

  def with_persona
    persona = Persona.first
    self.user_personas.create!(persona: persona, active: true)
  end

  def with_account
    self.create_account!(coins: 0)
  end

  def set_profile
    build_profile unless profile
  end
end
