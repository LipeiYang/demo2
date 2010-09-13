module Modules::Scopes::TermProduct
  
  def self.included(base)
    base.named_scope :for_product, lambda { |o| {:conditions => ["product_id = ?", o.product_id]} }
  end
  
end