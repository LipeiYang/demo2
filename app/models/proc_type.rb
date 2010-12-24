class ProcType < ActiveRecord::Base
  has_many :order_proc_maps
  has_many :orders, :through => :order_proc_maps

  def self.list
    ProcType.all(:order=>"name")
  end
end
