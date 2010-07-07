class AddIsPaiedToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :is_paied, :string
  end

  def self.down
    remove_column :orders, :is_paied
  end
end
