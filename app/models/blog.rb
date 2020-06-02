class Blog < ApplicationRecord
  belongs_to :user
  
  has_many :categories
  has_many :blog_tags, dependent: :destroy
  has_many :tags, through: :blog_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :like_blogs, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: {maximum: 100}
  validates :url, presence: true, uniqueness: true
  validates :body, presence: true, length: {maximum: 400}
  validates :tags, length: {maximum: 10}

  def liked_by?(user)
    like_blogs.where(like_user_id: user.id).exists?
  end

  def self.search(input)
    return nil if input == ""
    Blog.where(["url LIKE ?", "#{input}"])
  end

end
