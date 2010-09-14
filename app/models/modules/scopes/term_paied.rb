module Modules::Scopes::TermPaied
  
  def self.included(base)
    base.named_scope :for_paied, lambda { |o| {:conditions => ["is_paied = ?", o.is_paied]} }
  end
  
end