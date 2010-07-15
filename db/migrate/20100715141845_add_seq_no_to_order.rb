class AddSeqNoToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :seq_no, :integer
  end

  def self.down
    remove_column :orders, :seq_no
  end
end
