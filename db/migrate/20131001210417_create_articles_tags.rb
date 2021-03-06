class CreateArticlesTags < ActiveRecord::Migration
  def change

  	create_table :articles_tags do |t|
      t.integer :article_id
      t.integer :tag_id
    end

    add_index :tags, :content, :unique => true
    add_index :articles_tags, :article_id
    add_index :articles_tags, :tag_id

  end
end
