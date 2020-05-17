class Tag < ApplicationRecord
  has_many :blog_tags
  has_many :blogs, through: :blog_tags

  def self.search(input)
    return nil if input == ""
    Tag.where(["name LIKE ?", "%#{input}%"]).limit(10)
  end
end
