class Receivable < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermCustomer, Modules::Scopes::SortDateSeqNo
  
  belongs_to :customer

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :customer
  validates_numericality_of :amount
  
  def self.search_receivables(criteria_receivable)
    rlt = Receivable.for_date_range(criteria_receivable)
    rlt = rlt.for_customer(criteria_receivable)
    rlt.by_date_seq_no
  end
  
  def before_save
    amount ||= 0
  end
   
end
