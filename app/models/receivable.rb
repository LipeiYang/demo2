class Receivable < ActiveRecord::Base
  belongs_to :customer

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :customer
  validates_numericality_of :amount
  
  def before_save
    self.amount ||=0
  end
   
end
