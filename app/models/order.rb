class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  
  
  def material_fee
    price*volume
  end
  
  def totale
    price*volume+manfee
  end
end
