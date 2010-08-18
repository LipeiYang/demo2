class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_numericality_of :volume, :price, :manfee

  named_scope :for_date_range, lambda { |start_date, end_date| {:conditions => ["date between ? and ?", start_date, end_date]} }
  named_scope :for_product, lambda { |qry_ord| {:conditions => ["product_id = ?", qry_ord.product_id]} }
  named_scope :for_customer, lambda { |qry_ord| {:conditions => ["customer_id = ?", qry_ord.customer_id]} }
  named_scope :by_date_seq_no, :order => 'date DESC, seq_no DESC'
  
  def self.search_orders(start_date, end_date, qry_ord)
    orders = Order.for_date_range(start_date, end_date)
    orders = orders.for_product(qry_ord) unless qry_ord.product_id==0
    orders = orders.for_customer(qry_ord) unless qry_ord.customer_id==0
    orders.by_date_seq_no
  end
  
  def self.str_civil(year, month, day)
    Date.civil year.to_i, month.to_i, day.to_i
  end
  
  def before_save
    self.manfee ||=0
    self.volume ||=0
    self.price ||=0
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
