class CreateArticlesAndPages < ActiveRecord::Migration
  def change
    create_table :articles_and_pages do |t|
      t.integer :article_id
      t.integer :journal_id
      t.integer :page_id
      t.integer :user_id
      t.integer :number_of_repush
      t.integer :number_of_article_repush
      t.string :style

      t.timestamps
    end
  end
end
