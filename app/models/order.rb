class Order < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, 
  Modules::Scopes::TermCustomer, 
  Modules::Scopes::TermProduct, 
  Modules::Scopes::TermPaied, 
  Modules::Scopes::SortDateSeqNo
  
  belongs_to :customer
  belongs_to :product
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :customer, :product, :date
  validates_numericality_of :volume, :price, :manfee

  def self.search_orders(criteria)
    in_date_range(criteria.start, criteria.end).
    in_customer(criteria.customer_id).
    in_product(criteria.product_id).
    in_pay_status(criteria.is_paied).
    by_date_seq_no.all
  end
  
  def before_save
    self.manfee ||= 0
    self.volume ||= 0
    self.price ||= 0
  end
  
  def material_fee
    price*volume
  end
  
  def total
    price*volume+manfee
  end
  
  def adjusted_material_cost
    product.price*volume
  end
  
  def estimate_material_cost
    product.weighted_cost.blank? ? adjusted_material_cost : product.weighted_cost*volume
  end
  
end
