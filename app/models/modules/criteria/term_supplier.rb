module Modules::Criteria::TermSupplier
  attr_accessor :supplier_id
  
  def init_supplier(id='')
    if id.blank?
      @supplier_id=nil
    else
      @supplier_id=id.to_i
    end
  end
  
  def all_suppliers?
    @supplier_id.blank?
  end
  
end