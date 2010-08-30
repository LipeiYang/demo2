class CreateCostItems < ActiveRecord::Migration
  def self.up
    create_table :cost_items do |t|
      t.integer :seq_no
      t.string :name
      t.float :price
      t.integer :period

      t.timestamps
    end
  end

  def self.down
    drop_table :cost_items
  end
end
