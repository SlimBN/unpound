class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :journal_id
      t.string :theme
      t.integer :number
      t.string :picture
      t.boolean :draft

      t.timestamps
    end
  end
end
