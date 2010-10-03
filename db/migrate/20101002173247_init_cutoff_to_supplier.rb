class InitCutoffToSupplier < ActiveRecord::Migration
  def self.up
    Supplier.all.each do |o|
      o.cutoff_date = Date.civil(2009,1,1)
      o.unpaid_amount = 0
      o.save
    end
  end

  def self.down
  end
end
