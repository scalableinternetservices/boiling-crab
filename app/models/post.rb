class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
	has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
