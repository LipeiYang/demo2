class Payable < ActiveRecord::Base
  include Modules::Scopes::TermDateRange, Modules::Scopes::TermSupplier, Modules::Scopes::SortDateSeq
  
  belongs_to :supplier

  validates_length_of :seq, :maximum => 20
  validates_presence_of :supplier
  validates_numericality_of :amount

  def self.search_payables(criteria)
    in_date_range(criteria.d_from, criteria.d_to).
    in_supplier(criteria.i_supplier).
    by_date_seq.all
  end
  
  def before_save
    amount ||= 0
  end
  
end
