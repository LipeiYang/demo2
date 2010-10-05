module Modules::Criteria::TermProduct
  attr_accessor :product_id
  
  def init_product(id=nil)
    if id.blank?
      @product_id=nil
    else
      @product_id=id.to_i
    end
  end

  def self.all?(id)
    id.blank?
  end
  
  def self.all
    nil
  end
  
end