class AddShareToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :share, :boolean, :defaut=>false
    User.all.each do |o|
      o.share = false
      o.save
    end
    
  end

  def self.down
    remove_column :users, :share
  end
end
