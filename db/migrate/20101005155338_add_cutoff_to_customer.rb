class AddCutoffToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :cutoff_date, :date
    add_column :customers, :inreceive_amount, :float, :defaut=>0
    Customer.all.each do |o|
      o.cutoff_date = Date.civil(2010,1,1)
      o.inreceive_amount = 0
      o.save
    end
  end

  def self.down
    remove_column :customers, :cutoff_date
    remove_column :customers, :inreceive_amount
  end
end
