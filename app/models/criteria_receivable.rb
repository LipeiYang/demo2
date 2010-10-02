class CriteriaReceivable
  include Modules::Criteria::TermDateRange, Modules::Criteria::TermCustomer

  def initialize(*arg)
    arg.empty? ? init_default : init_params(arg[0])
  end
  
  private
  
    def init_default
      init_date_range Date.today-1.month, Date.today
      init_customer
    end
    
    def init_params(criteria_params)
      init_date_range get_start_date(criteria_params), get_end_date(criteria_params)
      init_customer criteria_params[:customer_id]
    end

end