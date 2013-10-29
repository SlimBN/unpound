class AddColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :country_id, :integer
    add_column :articles, :town, :string
    add_column :articles, :folder_id, :integer
  end
end
