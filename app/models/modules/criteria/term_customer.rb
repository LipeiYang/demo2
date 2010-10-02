module Modules::Criteria::TermCustomer
  attr_accessor :customer_id
  
  def init_customer(id='')
    if id.blank?
      @customer_id=nil
    else
      @customer_id=id.to_i
    end
  end

  def all_customers?
    @customer_id.blank?
  end
  
end