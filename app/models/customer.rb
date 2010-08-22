class Customer < ActiveRecord::Base
  has_many :orders
  has_many :receivables
  
  validates_presence_of :name
  
end
