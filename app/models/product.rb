class Product < ActiveRecord::Base
  has_many :orders
  has_many :purchases
  
  validates_length_of :seq, :name, :maximum => 20
  validates_presence_of :name, :cutoff_date
  validates_uniqueness_of :name
  validates_numericality_of :price, :inventory

  
  def weighted_cost
    if purchases.empty?
      ''
    else
      dd = 0
      dr = purchases.all.sum { |t| dd+=t.volume; t.volume*t.price }
      dr/dd
    end
  end
  
  def sell_amount
    Order.in_product(id).in_date_range(cutoff_date+1.day, nil).sum(:volume)
  end
  
  def purchase_amount
    Purchase.in_product(id).in_date_range(cutoff_date+1.day, nil).sum(:volume)
  end
  
  def remain_amount
    inventory+purchase_amount-sell_amount
  end
  
end
