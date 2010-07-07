class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  
  def totale
    price*volume+manfee
  end
end
