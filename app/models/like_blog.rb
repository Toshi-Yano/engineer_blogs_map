class LikeBlog < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :user_id, presence: true
  validates :blog_id, presence: true
end