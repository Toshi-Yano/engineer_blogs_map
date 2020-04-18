class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :blog
  has_many :like_blog, dependent: :destroy
  has_many :review,    dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 16 }
end
