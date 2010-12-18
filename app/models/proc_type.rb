class ProcType < ActiveRecord::Base
  has_many :order_proc_maps
  has_many :orders, :through => :order_proc_maps
  
end
