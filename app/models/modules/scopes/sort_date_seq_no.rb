module Modules::Scopes::SortDateSeqNo
  
  def self.included(base)
    base.named_scope :by_date_seq_no, :order => 'date DESC, seq_no DESC'
  end
  
end