class Purchase < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermSupplier, Modules::Scopes::TermProduct, Modules::Scopes::TermPaied, Modules::Scopes::SortDateSeqNo

  belongs_to :product
  belongs_to :supplier
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :supplier, :product
  validates_numericality_of :volume, :price
  
  def self.search_purchases(criteria)
    in_date_range(criteria.start, criteria.end).
    in_supplier(criteria.supplier_id).
    in_product(criteria.product_id).
    in_pay_status(criteria.is_paied).
    by_date_seq_no
  end

  def before_save
    self.volume ||=0
    self.price ||=0
  end
 
  def total
    price*volume
  end
  
end
