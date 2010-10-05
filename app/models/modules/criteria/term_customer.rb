module Modules::Criteria::TermCustomer
  attr_accessor :customer_id
  
  def init_customer(id=nil)
    if id.blank?
      @customer_id=nil
    else
      @customer_id=id.to_i
    end
  end

  def self.all?(id)
    id.blank?
  end
  
  def self.all
    nil
  end
  
end