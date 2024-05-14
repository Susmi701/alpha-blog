class AddDescriptionToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :Description, :text
  end
end
