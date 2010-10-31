class Customer < ActiveRecord::Base
  has_many :orders
  has_many :receivables
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :name, :cutoff_date
  validates_uniqueness_of :name
  validates_numericality_of :inreceive_amount
  
  
  MIN_SINK = 100
  IDLE_PERIOD = 2.months
  
  def unsettle_amount_after_cutoff
    Order.in_date_range(cutoff_date+1.day, nil).in_pay_status(NO).in_customer(id).all.sum(&:total)
  end
  
  def received_amount_after_cutoff
    Receivable.in_date_range(cutoff_date+1.day, nil).in_customer(id).sum(:amount)
  end
  
  def amount_will_receive
    inreceive_amount+unsettle_amount_after_cutoff-received_amount_after_cutoff
  end
  
  def long_time_no_trade?
    (Order.in_customer(id).maximum(:date) || created_at) < Date.today-IDLE_PERIOD
  end
  
  def unsettle?
    amount_will_receive > MIN_SINK
  end
end
