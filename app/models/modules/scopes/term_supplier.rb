module Modules::Scopes::TermSupplier
  
  def self.included(base)
    base.named_scope :in_supplier, lambda { |criteria| 
      unless criteria.all_suppliers?
        {:conditions => ["supplier_id = ?", criteria.supplier_id]}
      end
    }
  end
  
end