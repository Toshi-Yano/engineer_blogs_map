class Review < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :user_id, presence: true
  validates :blog_id, presence: true
  validates :body, presence: true, length: {maximum: 200}
  validates :article_title, length: {maximum: 100}
end