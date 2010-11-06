class Purchase < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermSupplier, Modules::Scopes::TermProduct, Modules::Scopes::TermPaied, Modules::Scopes::SortDateSeq

  belongs_to :product
  belongs_to :supplier
  
  validates_length_of :seq, :maximum => 20
  validates_presence_of :supplier, :product
  validates_numericality_of :volume, :price
  
  def self.search_purchases(criteria)
    in_date_range(criteria.d_from, criteria.d_to).
    in_supplier(criteria.i_supplier).
    in_product(criteria.i_product).
    in_pay_status(criteria.s_paid).
    by_date_seq.all
  end

  def before_save
    self.volume ||=0
    self.price ||=0
  end
 
  def total
    price*volume
  end
  
end
