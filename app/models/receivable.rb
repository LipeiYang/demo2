class Receivable < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermCustomer, Modules::Scopes::SortDateSeqNo
  
  belongs_to :customer

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :customer
  validates_numericality_of :amount
  
  def self.search_receivables(criteria)
    in_date_range(criteria.start, criteria.end).
    in_customer(criteria.customer_id).
    by_date_seq_no.all
  end
  
  def before_save
    amount ||= 0
  end
   
end
