class Payable < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermSupplier, Modules::Scopes::SortDateSeqNo
  
  belongs_to :supplier

  validates_numericality_of :seq_no, :only_integer => true, :message=>:not_an_integer
  validates_presence_of :supplier
  validates_numericality_of :amount

  def self.search_payables(criteria)
    in_date_range(criteria.start, criteria.end).
    in_supplier(criteria.supplier_id).
    by_date_seq_no
  end
  
  def before_save
    amount ||= 0
  end
  
end
