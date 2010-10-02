module Modules::Scopes::TermDateRange
  
  def self.included(base)
    base.named_scope :in_date_range, lambda { |o| {:conditions => ["date between ? and ?", o.start, o.end]} }
  end
  
end