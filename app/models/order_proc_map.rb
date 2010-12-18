class OrderProcMap < ActiveRecord::Base
  belongs_to :order
  belongs_to :proc_type
  
  validates_presence_of :num
  validates_numericality_of :num
  
  def fee
    proc_type.price*num
  end
end
