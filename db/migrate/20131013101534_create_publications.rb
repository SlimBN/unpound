class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :article_id
      t.integer :journal_id
      t.integer :user_id
      t.string :element

      t.timestamps
    end
  end
end
