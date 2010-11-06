class AddSeqToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :seq, :string
    Product.all.each do |o|
      o.seq = o.id.to_s
      o.save
    end
  end

  def self.down
    remove_column :products, :seq
  end
end
