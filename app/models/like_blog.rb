class LikeBlog < ApplicationRecord
  belongs_to :blog
  belongs_to :user, optional: true

  validates :like_user_id, presence: true
  validates :blog_id, presence: true

end