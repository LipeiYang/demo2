class CriteriaOrder
  include Modules::Criteria::TermDateRange, Modules::Criteria::TermCustomer, Modules::Criteria::TermProduct, Modules::Criteria::TermPaied
  
  def initialize(*arg)
    arg.empty? ? init_default : init_params(arg[0])
  end
  
  def init_default
    @start = Date.today-1.days
    @end = Date.today
    @product_id = 0
    @customer_id = 0
    @is_paied = ''
  end

	def init_params(criteria_params)
	  @start = get_start_date(criteria_params)
	  @end = get_end_date(criteria_params)
	  @product_id = criteria_params[:product_id].to_i
	  @customer_id = criteria_params[:customer_id].to_i
	  @is_paied = criteria_params[:is_paied]
	end
  
end