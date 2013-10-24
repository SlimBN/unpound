class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :what

      t.timestamps
    end
  end
end
