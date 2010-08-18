class SetDefaultToPurchases < ActiveRecord::Migration
  def self.up
    change_column :purchases, :price, :float, :default => 0
    change_column :purchases, :volume, :float, :default => 0
  end

  def self.down
    change_column :purchases, :price, :float
    change_column :purchases, :volume, :float
  end
end
