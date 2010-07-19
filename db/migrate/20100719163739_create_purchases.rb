class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.date :date
      t.integer :product_id
      t.float :price
      t.float :volume
      
      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
