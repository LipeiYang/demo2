class SetDefaultValueForOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :manfee, :float, :default => 0
    change_column :orders, :price, :float, :default => 0
    change_column :orders, :volume, :float, :default => 0
  end

  def self.down
    change_column :orders, :manfee, :float
    change_column :orders, :price, :float
    change_column :orders, :volume, :float
  end
end
