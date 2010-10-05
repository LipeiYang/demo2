class Supplier < ActiveRecord::Base
  has_many :purchases
  has_many :payables
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :name, :cutoff_date
  validates_uniqueness_of :name
  validates_numericality_of :unpaied_amount

  def unsettle_amount_after_cutoff
    Purchase.in_supplier(id).in_date_range(cutoff_date+1.day, nil).in_pay_status(NO).all.sum(&:total)
    # Purchase.in_supplier(id).in_date_range(cutoff_date+1.day, nil).in_pay_status(NO).sum("price*volume").to_f
  end
  
  def paied_amount_after_cutoff
    Payable.in_supplier(id).in_date_range(cutoff_date+1.day, nil).sum(:amount)
  end
  
  def amount_to_pay
    unpaied_amount+unsettle_amount_after_cutoff-paied_amount_after_cutoff
  end
end
