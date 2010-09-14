class CriteriaPayable
  include Modules::Criteria::TermDateRange, Modules::Criteria::TermSupplier

  def initialize(*arg)
    arg.empty? ? init_default : init_params(arg[0])
  end
  
  private
  
    def init_default
      @start = Date.today-1.month
      @end = Date.today
      @supplier_id = 0
    end
    
    def init_params(criteria_params)
      @start = get_start_date(criteria_params)
      @end = get_end_date(criteria_params)
      @supplier_id = criteria_params[:supplier_id].to_i
    end

end