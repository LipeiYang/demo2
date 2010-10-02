module Modules::Criteria::TermProduct
  attr_accessor :product_id
  
  def init_product(id='')
    if id.blank?
      @product_id=nil
    else
      @product_id=id.to_i
    end
  end

  def all_products?
    @product_id.blank?
  end
  
end