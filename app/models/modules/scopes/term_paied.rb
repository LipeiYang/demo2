module Modules::Scopes::TermPaied
  
  def self.included(base)
    base.named_scope :in_pay_status, lambda { |is_paied|
      unless Modules::Criteria::TermPaied.all? is_paied
        {:conditions => ["is_paied = ?", is_paied]}
      end
    }
  end
  
end