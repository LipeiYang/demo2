class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.date :date
      t.float :price
      t.float :volume
      t.float :manfee
      t.integer :customer_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
