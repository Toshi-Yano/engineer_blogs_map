class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :blog_tags, dependent: :destroy
  has_many :tags, through: :blog_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :like_blogs, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :body, presence: true, length: {maximum: 200}

  def like_by?(user)
    like_blogs.where(like_user_id: user.id).exists?
  end

  def self.search(search)
    return Blog.all unless search
    Blog.where("title LIKE(?) or body LIKE(?)", "%#{search}%", "%#{search}%")
  end

  def self.tag_search(search)
    # Blog.where()
  end

  # def self.search(blogs, tags)
  #   return Blog.all unless blogs
  #   blogs = Blog.joins(:tags).where("title LIKE(?)", "%#{blogs}%")
  #   # binding.pry
  #   for tag in tags do
  #     results += blogs.where("name LIKE(?)", "%#{tag}%")
  #   end
  # end
  # def self.search(blogs, tags)
  #   return Blog.all unless blogs
  #   Blog.joins(:tags).where("title LIKE(?) AND name LIKE(?)", "%#{blogs}%", "%#{tags}%")
  # end
  
  # def self.search_tags(search)
  #   return Blog.all unless search
  #   Blog.where("title LIKE(?)", "%#{search}%")
  # end
end
