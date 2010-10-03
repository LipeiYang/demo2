class RenameSupplierUnpaied < ActiveRecord::Migration
  def self.up
    rename_column :suppliers, :unpaid_amount, :unpaied_amount
  end

  def self.down
    rename_column :suppliers, :unpaied_amount, :unpaid_amount
  end
end
