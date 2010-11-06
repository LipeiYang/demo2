class Invest < ActiveRecord::Base

  belongs_to :cost_item

  validates_length_of :seq, :maximum => 20
  validates_presence_of :cost_item
  validates_numericality_of :amount

end
