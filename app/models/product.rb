class Product < ActiveRecord::Base
  has_many :orders
  has_many :purchases
  
  validates_presence_of :name
  validates_numericality_of :price

  
  def weighted_cost
    purchases.blank? ? "" : purchases.to_a.sum { |t| t.volume*t.price }/purchases.to_a.sum { |t| t.volume }
  end
end
