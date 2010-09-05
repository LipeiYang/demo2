class CostItem < ActiveRecord::Base
  has_many :invests
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :price

  def day_cost
    price/period
  end
  
end
