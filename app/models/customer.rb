class Customer < ActiveRecord::Base
  has_many :orders
  has_many :receivables
  
  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :name
  validates_uniqueness_of :name
end
