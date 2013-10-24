class CreateSoons < ActiveRecord::Migration
  def change
    create_table :soons do |t|
      t.string :mail, :null => false, :unique => true
      t.string :active

      t.timestamps
    end
  end
end
