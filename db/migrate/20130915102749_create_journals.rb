class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.string :logo
      t.string :cover
      t.integer :user_id
      t.integer :country_id

      t.timestamps
    end
  end
end
