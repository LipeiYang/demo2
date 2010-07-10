class RemoveHistoryPoint < ActiveRecord::Migration
  def self.up
    drop_table :history_points
  end

  def self.down
    create_table :history_points do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :time

      t.timestamps
    end
  end
end
