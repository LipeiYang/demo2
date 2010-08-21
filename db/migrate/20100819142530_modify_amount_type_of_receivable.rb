class ModifyAmountTypeOfReceivable < ActiveRecord::Migration
  def self.up
    # change_column :receivables, :amount, :decimal, :default => 0, :scale => 2, :null => false
  end

  def self.down
    # change_column :receivables, :amount, :float, :default => 0
  end
end
