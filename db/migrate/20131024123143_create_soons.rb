class CreateSoons < ActiveRecord::Migration
  def change
    create_table :soons do |t|
      t.string :mail
      t.string :active

      t.timestamps
    end
  end
end
