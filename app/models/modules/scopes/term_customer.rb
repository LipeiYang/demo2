module Modules::Scopes::TermCustomer
  
  def self.included(base)
    base.named_scope :for_customer, lambda { |o| {:conditions => ["customer_id = ?", o.customer_id]} }
  end
  
end