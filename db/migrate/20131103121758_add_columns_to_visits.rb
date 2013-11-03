class AddColumnsToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :element_id, :integer
    add_column :visits, :user_id, :integer
    add_column :visits, :ip_address, :string
  end
end
