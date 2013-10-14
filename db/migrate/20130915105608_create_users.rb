class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text :about
      t.integer :country_id
      t.string :town
      t.string :avatar
      t.string :web
      t.string :studies
      t.string :background
      t.string :avatar

      t.timestamps
    end
  end
end
