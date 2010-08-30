class CreatePayables < ActiveRecord::Migration
  def self.up
    create_table :payables do |t|
      t.integer :seq_no
      t.date :date
      t.integer :supplier_id
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :payables
  end
end
