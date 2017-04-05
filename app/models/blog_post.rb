class BlogPost < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
  validates :picture, presence: true

  belongs_to :user

  mount_uploader :picture, PictureUploader

  def new_post?
    created_at + 7.days > DateTime.current
  end
end
