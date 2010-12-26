class OrderProcMap < ActiveRecord::Base
  belongs_to :order
  belongs_to :proc_type
  
  validates_presence_of :num, :price
  validates_numericality_of :num, :price
  
  def fee
    price*num
  end
end
