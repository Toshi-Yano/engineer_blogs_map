class AddArticleToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :article_url, :string
    add_column :reviews, :article_title, :string
  end
end
