class OrderProcMap < ActiveRecord::Migration
  def self.up
    create_table :order_proc_maps do |t|
      t.integer :order_id
      t.integer :proc_type_id
      t.integer :num, :defaut => 0
      t.float :price
      
      t.timestamps
    end
  end

  def self.down
    drop_table :order_proc_maps
  end
end
