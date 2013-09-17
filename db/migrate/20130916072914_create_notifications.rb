class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :issue_id
      t.boolean :seen

      t.timestamps
    end
  end
end
