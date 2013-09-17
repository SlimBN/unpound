class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :journal_id

      t.timestamps
    end
  end
end
