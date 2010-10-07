module Modules::Criteria::TermDateRange
  attr_accessor :start, :end
  
  def init_date_range(from, to)
    @start = from
    @end = to
  end
  
  def days
    @end-@start+1
  end
  
  def get_start_date(params)
    get_date 'start', params
  end

  def get_end_date(params)
    get_date 'end', params
  end

  private
  
    def get_date(prefix, params)
      str_civil params["#{prefix}(1i)"], params["#{prefix}(2i)"], params["#{prefix}(3i)"]
    end
    
    def str_civil(year, month, day)
      Date.civil year.to_i, month.to_i, day.to_i
    end
  
end