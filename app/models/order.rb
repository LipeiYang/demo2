class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product
  
  
  def self.search_orders(start_date, end_date)
    conditions = "date between '#{start_date}' and '#{end_date}'"
    @orders = Order.all :conditions => conditions, :order => "date DESC, seq_no DESC"
  end
  
  def self.str_civil(year, month, day)
    Date.civil year.to_i, month.to_i, day.to_i
  end
  
  def material_fee
    price*volume
  end
  
  def totale
    price*volume+manfee
  end
  
end
