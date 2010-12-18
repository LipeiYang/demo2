class Order < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, 
  Modules::Scopes::TermCustomer, 
  Modules::Scopes::TermProduct, 
  Modules::Scopes::TermPaied, 
  Modules::Scopes::SortDateSeq
  
  belongs_to :customer
  belongs_to :product

  has_many :order_proc_maps, :dependent => :destroy
  has_many :proc_types, :through => :order_proc_maps
  accepts_nested_attributes_for :order_proc_maps, :allow_destroy => true, :reject_if => lambda {|a| a[:num].blank? }
  
  validates_length_of :seq, :maximum => 20
  validates_presence_of :customer, :product, :date
  validates_numericality_of :volume, :price, :manfee

  def self.search_orders(criteria)
    in_date_range(criteria.d_from, criteria.d_to).
    in_customer(criteria.i_customer).
    in_product(criteria.i_product).
    in_pay_status(criteria.s_paid).
    by_date_seq.all
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
