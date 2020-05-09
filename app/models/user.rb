class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :blog
  has_many :like_blog, dependent: :destroy
  has_many :review,    dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 16 }
  validates :blog_id, null: false
  validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }
  validates :myblog, uniqueness: true, allow_blank: true

  def like_by?(user)
    like_blogs.where(like_user_id: user.id).exists?
  end
end