class CreateHistoryPoints < ActiveRecord::Migration
  def self.up
    create_table :history_points do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :time

      t.timestamps
    end
  end

  def self.down
    drop_table :history_points
  end
end
