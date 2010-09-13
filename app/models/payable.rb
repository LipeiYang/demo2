class Payable < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermSupplier, Modules::Scopes::SortDateSeqNo
  
  belongs_to :supplier

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :supplier
  validates_numericality_of :amount

  def self.search_payables(criteria)
    rlt = Payable.for_date_range(criteria)
    rlt = rlt.for_supplier(criteria)
    rlt.by_date_seq_no
  end
  
  def before_save
    amount ||= 0
  end
  
end
