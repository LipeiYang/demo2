class Purchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :supplier
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :supplier, :product
  validates_numericality_of :volume, :price
  
  named_scope :for_date_range, lambda { |start_date, end_date| {:conditions => ["date between ? and ?", start_date, end_date]} }
  named_scope :for_product, lambda { |o| {:conditions => ["product_id = ?", o.product_id]} }
  named_scope :for_supplier, lambda { |o| {:conditions => ["supplier_id = ?", o.supplier_id]} }
  named_scope :by_date_seq_no, :order => 'date DESC, seq_no DESC'
  
  def self.search_purchases(start_date, end_date, qry_pur)
    purchases = Purchase.for_date_range(start_date, end_date)
    purchases = purchases.for_product(qry_pur) unless qry_pur.product_id==0
    purchases = purchases.for_supplier(qry_pur) unless qry_pur.supplier_id==0
    purchases.by_date_seq_no
  end

  def before_save
    self.volume ||=0
    self.price ||=0
  end
 
  def total
    price*volume
  end
  
end
