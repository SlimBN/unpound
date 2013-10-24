class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :abstract
      t.text :content
      t.integer :lang_id
      t.string :slug
      t.integer :user_id
      t.string :photo

      t.timestamps
    end
  end
end
