module Modules::Scopes::TermSupplier
  
  def self.included(base)
    base.named_scope :in_supplier, lambda { |supplier_id| 
      unless Modules::Criteria::TermSupplier.all? supplier_id
        {:conditions => ["supplier_id = ?", supplier_id]}
      end
    }
  end
  
end