module Modules::Scopes::TermSupplier
  
  def self.included(base)
    base.named_scope :for_supplier, lambda { |o| {:conditions => ["supplier_id = ?", o.supplier_id]} }
  end
  
end