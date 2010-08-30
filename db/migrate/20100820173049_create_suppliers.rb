class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.integer :seq_no
      t.string :name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end