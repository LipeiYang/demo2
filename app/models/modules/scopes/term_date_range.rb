module Modules::Scopes::TermDateRange
  
  def self.included(base)
    base.named_scope :in_date_range, lambda { |start_date, end_date| 
      if start_date!=nil && end_date!=nil
        { :conditions => {:date=>start_date..end_date} }
      elsif start_date!=nil && end_date==nil
        { :conditions => ["date >= ?",start_date] }
      elsif start_date==nil && end_date!=nil
        { :conditions => ["date <= ?",end_date!] }
      else
        {}
      end
    }
  end
  
end