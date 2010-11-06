module Modules::Scopes::SortDateSeq
  
  def self.included(base)
    base.named_scope :by_date_seq, :order => 'date DESC, length(seq) DESC, seq DESC'
  end

end