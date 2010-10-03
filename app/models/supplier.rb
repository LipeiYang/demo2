class Supplier < ActiveRecord::Base

  has_many :purchases
  has_many :payables
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :name, :cutoff_date
  validates_uniqueness_of :name
  validates_numericality_of :unpaied_amount

end
