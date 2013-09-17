class AddOrderToPages < ActiveRecord::Migration
  def change
    add_column :pages, :classement, :integer
  end
end
