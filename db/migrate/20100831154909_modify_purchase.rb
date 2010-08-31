class ModifyPurchase < ActiveRecord::Migration
  def self.up
    add_column :purchases, :supplier_id, :integer
    add_column :purchases, :is_paied, :string
  end

  def self.down
    remove_column :purchases, :supplier_id
    remove_column :purchases, :is_paied
  end
end
