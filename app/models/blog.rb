class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :blog_tags
  has_many :tags, through: :blog_tags
  has_many :reviews, dependent: :destroy
  has_many :like_blogs, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :body, presence: true, length: {maximum: 200}

  def like_by?(user)
    like_blogs.where(user_id: user.id).exists?
  end
end
