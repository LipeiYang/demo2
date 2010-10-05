module Modules::Scopes::TermCustomer
  
  def self.included(base)
    base.named_scope :in_customer, lambda { |customer_id|
      unless Modules::Criteria::TermCustomer.all? customer_id
        {:conditions => ["customer_id = ?", customer_id]}
      end
    }
  end
  
end