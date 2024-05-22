class RenameColumnNameTableArticles < ActiveRecord::Migration[7.1]
  def change
    rename_column :articles, :Title, :title
    rename_column :articles, :Description, :description
  end
end
