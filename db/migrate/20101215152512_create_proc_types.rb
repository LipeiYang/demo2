class CreateProcTypes < ActiveRecord::Migration
  def self.up
    create_table :proc_types do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :proc_types
  end
end
