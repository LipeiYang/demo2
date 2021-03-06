class CostItem < ActiveRecord::Base
  has_many :invests
  
  validates_length_of :seq, :name, :maximum => 20
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :price

  def day_cost
    price/period
  end
  
end
