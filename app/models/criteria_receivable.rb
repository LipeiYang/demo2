class CriteriaReceivable
  include Modules::Criteria::TermDateRange, Modules::Criteria::TermCustomer

  def initialize(*arg)
    arg.empty? ? init_default : init_params(arg[0])
  end
  
  private
  
    def init_default
      @start = Date.today-1.month
      @end = Date.today
      @customer_id = 0
    end
    
    def init_params(criteria_receivable_params)
      @start = get_start_date(criteria_receivable_params)
      @end = get_end_date(criteria_receivable_params)
      @customer_id = criteria_receivable_params[:customer_id].to_i
    end

end