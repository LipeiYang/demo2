class Receivable < ActiveRecord::Base
  belongs_to :customer
  
  def before_save
    self.amount ||=0
  end
   
end
