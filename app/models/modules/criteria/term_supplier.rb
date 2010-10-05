module Modules::Criteria::TermSupplier 
  attr_accessor :supplier_id
  
  def init_supplier(id=nil)
    if id.blank?
      @supplier_id=nil
    else
      @supplier_id=id.to_i
    end
  end
  
  def self.all?(id)
    id.blank?
  end
  
  def self.all
    nil
  end
  
end