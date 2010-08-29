class AddSeqToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :seq_no, :integer
  end

  def self.down
    remove_column :customers, :seq_no
  end
end
