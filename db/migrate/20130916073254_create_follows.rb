class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :followee_id
      t.integer :journal_id

      t.timestamps
    end
  end
end
