class Supplier < ActiveRecord::Base

  has_many :purchases
  has_many :payables
  
  validates_presence_of :name

end
