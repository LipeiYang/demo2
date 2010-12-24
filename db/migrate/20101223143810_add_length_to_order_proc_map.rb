class AddLengthToOrderProcMap < ActiveRecord::Migration
  def self.up
    add_column :order_proc_maps, :leng, :float
  end

  def self.down
    remove_column :order_proc_maps, :leng
  end
end
