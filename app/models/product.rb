class Product < ActiveRecord::Base
  has_many :orders
  has_many :purchases
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :price

  
  def weighted_cost
    if purchases.empty?
      ''
    else
      dd = 0
      dr = purchases.all.sum { |t| dd+=t.volume; t.volume*t.price }
      dr/dd
    end
  end
end
