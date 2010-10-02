class CriteriaPurchase
  include Modules::Criteria::TermDateRange, 
  Modules::Criteria::TermSupplier, 
  Modules::Criteria::TermProduct, 
  Modules::Criteria::TermPaied
  
  def initialize(*arg)
    arg.empty? ? init_default : init_params(arg[0])
  end
  
  def init_default
    init_date_range Date.today-7.days, Date.today
    init_supplier
    init_product
    init_paied
  end

	def init_params(criteria_params)
    init_date_range get_start_date(criteria_params), get_end_date(criteria_params)
    init_supplier criteria_params[:supplier_id]
    init_product criteria_params[:product_id]
    init_paied criteria_params[:is_paied]
	end
  
end