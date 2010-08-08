class Purchase < ActiveRecord::Base
  belongs_to :product

  def before_save
    self.volume ||=0
    self.price ||=0
  end
 
  def total
    price*volume
  end
  
end
