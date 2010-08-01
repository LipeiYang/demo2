class CreateReceivables < ActiveRecord::Migration
  def self.up
    create_table :receivables do |t|
      t.integer :seq_no
      t.date :date
      t.integer :customer_id
      t.float :amount, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :receivables
  end
end
