class AddStyleToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :style, :string
  end
end
