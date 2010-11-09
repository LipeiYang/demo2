class AddCutoffToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :cutoff_date, :date
    add_column :products, :inventory, :float, :defaut=>0
    Product.all.each do |o|
      o.cutoff_date = Date.civil(2010,1,1)
      o.inventory = 0
      o.save
    end
  end

  def self.down
    remove_column :products, :cutoff_date
    remove_column :products, :inventory
  end
end
