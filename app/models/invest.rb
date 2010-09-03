class Invest < ActiveRecord::Base

  belongs_to :cost_item

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :cost_item
  validates_numericality_of :amount

end
