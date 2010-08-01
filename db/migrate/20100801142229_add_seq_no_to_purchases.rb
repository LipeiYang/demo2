class AddSeqNoToPurchases < ActiveRecord::Migration
  def self.up
    add_column :purchases, :seq_no, :integer
  end

  def self.down
    remove_column :purchases, :seq_no
  end
end
