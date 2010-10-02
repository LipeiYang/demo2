module Modules::Scopes::TermPaied
  
  def self.included(base)
    base.named_scope :in_pay_status, lambda { |criteria|
      unless criteria.all_pay_status?
        {:conditions => ["is_paied = ?", criteria.is_paied]}
      end
    }
  end
  
end