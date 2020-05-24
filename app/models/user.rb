class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blog
  has_many :like_blog, dependent: :destroy
  has_many :review,    dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 16 }
  validates :email, uniqueness: true, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }
  validates :introduction, length: {maximum: 200}
  devise    :validatable,     password_length: 6..128
end