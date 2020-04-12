class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :blog_tags
  has_many :tags, through: :blog_tags
  has_many :reviews, dependent: :destroy
  has_many :like_blogs, dependent: :destroy
end
