class Product < ActiveRecord::Base
  has_many :orders
  has_many :purchases
  
  def weighted_cost
    if purchases.blank?
      ""
    else
      purchases.to_a.sum { |t| t.volume*t.price }/purchases.to_a.sum { |t| t.volume }
    end
  end
end
