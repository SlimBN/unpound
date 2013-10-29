class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.string :skin
      t.text :description
      t.string :kind
      t.integer :user_id
      t.boolean :hidden

      t.timestamps
    end
  end
end
