class Purchase < ActiveRecord::Base
  belongs_to :product

  def total
    price*volume
  end
  
end
