class CreateInvests < ActiveRecord::Migration
  def self.up
    create_table :invests do |t|
      t.integer :seq_no
      t.date :date
      t.integer :cost_item_id
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :invests
  end
end
