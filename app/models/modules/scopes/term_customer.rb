module Modules::Scopes::TermCustomer
  
  def self.included(base)
    base.named_scope :in_customer, lambda { |criteria| 
      unless criteria.all_customers?
        {:conditions => ["customer_id = ?", criteria.customer_id]}
      end
    }
  end
  
end