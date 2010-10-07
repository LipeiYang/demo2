class RedoSupplierCutoff < ActiveRecord::Migration
  def self.up
    remove_column :suppliers, :cutoff_date
    remove_column :suppliers, :unpaied_amount
    add_column :suppliers, :cutoff_date, :date
    add_column :suppliers, :unpaied_amount, :float, :defaut=>0
    Supplier.all.each do |o|
      o.cutoff_date = Date.civil(2010,1,1)
      o.unpaied_amount = 0
      o.save
    end
  end

  def self.down
    remove_column :suppliers, :cutoff_date
    remove_column :suppliers, :unpaied_amount
  end
end
