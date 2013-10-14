class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :journal_id
      t.integer :issue_id
      t.integer :page_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
