class BlogPost < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false

  belongs_to :user

  has_one_attached :picture, dependent: :destroy

  def new_post?
    created_at + 7.days > DateTime.current
  end
end
