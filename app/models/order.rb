class Order < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermCustomer, Modules::Scopes::TermProduct, Modules::Scopes::TermPaied, Modules::Scopes::SortDateSeqNo
  
  belongs_to :customer
  belongs_to :product
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :customer, :product
  validates_numericality_of :volume, :price, :manfee
  
  def self.search_orders(criteria)
    rlt = Order.for_date_range(criteria)
    rlt = rlt.for_product(criteria) unless criteria.product_id==0
    rlt = rlt.for_customer(criteria) unless criteria.customer_id==0
    rlt = rlt.for_paied(criteria) unless criteria.is_paied==''
    rlt.by_date_seq_no
  end
  
  def before_save
    self.manfee ||= 0
    self.volume ||= 0
    self.price ||= 0
  end
  
  def material_fee
    price*volume
  end
  
  def totale
    price*volume+manfee
  end
  
  def material_cost
    product.price*volume
  end
end
