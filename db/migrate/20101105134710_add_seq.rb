class AddSeq < ActiveRecord::Migration
  def self.up
    add_column :customers, :seq, :string
    add_column :cost_items, :seq, :string
    add_column :invests, :seq, :string
    add_column :orders, :seq, :string
    add_column :payables, :seq, :string
    add_column :purchases, :seq, :string
    add_column :receivables, :seq, :string
    add_column :suppliers, :seq, :string
    
    Customer.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    CostItem.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    Invest.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    Order.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    Payable.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    Purchase.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    Receivable.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    Supplier.all.each do |o|
      o.seq = o.seq_no.to_s
      o.save
    end
    
  end

  def self.down
    remove_column :customers, :seq
    remove_column :cost_items, :seq
    remove_column :invests, :seq
    remove_column :orders, :seq
    remove_column :payables, :seq
    remove_column :purchases, :seq
    remove_column :receivables, :seq
    remove_column :suppliers, :seq
  end
end
