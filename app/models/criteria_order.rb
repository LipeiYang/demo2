class CriteriaOrder
  include CriteriaDate, CriteriaProduct, CriteriaPaied
  
  attr_accessor :customer_id
  
  def initialize
    @start = Date.today-1.days
    @end = Date.today
    @product_id = 0
    @customer_id = 0
    @is_paied = ''
  end
end