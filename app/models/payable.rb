class Payable < ActiveRecord::Base
  belongs_to :supplier

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :supplier
  validates_numericality_of :amount
  
end
