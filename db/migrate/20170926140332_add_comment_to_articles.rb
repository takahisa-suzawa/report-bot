class AddCommentToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :comment, :string
  end
end
