class Review < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :user_id, presence: true
  validates :blog_id, presence: true
  validates :body, presence: true
end