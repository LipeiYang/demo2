class Purchase < ActiveRecord::Base
  belongs_to :product
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_numericality_of :volume, :price

  def before_save
    self.volume ||=0
    self.price ||=0
  end
 
  def total
    price*volume
  end
  
end
