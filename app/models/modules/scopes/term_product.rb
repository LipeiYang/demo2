module Modules::Scopes::TermProduct
  
  def self.included(base)
    base.named_scope :in_product, lambda { |criteria| 
      unless criteria.all_products?
        {:conditions => ["product_id = ?", criteria.product_id]}
      end
    }
  end

end