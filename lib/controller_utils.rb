module ControllerUtils

  def get_start_date(params)
    get_date :start, params
  end

  def get_end_date(params)
    get_date :end, params
  end

  private
  
    def get_date(prefix, params)
      str_civil params[prefix][:year], params[prefix][:month], params[prefix][:day]
    end
    
    def str_civil(year, month, day)
      Date.civil year.to_i, month.to_i, day.to_i
    end

end
