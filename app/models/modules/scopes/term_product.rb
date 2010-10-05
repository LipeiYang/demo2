module Modules::Scopes::TermProduct
  
  def self.included(base)
    base.named_scope :in_product, lambda { |product_id| 
      unless Modules::Criteria::TermProduct.all? product_id
        {:conditions => ["product_id = ?", product_id]}
      end
    }
  end

end