module Modules::Criteria::TermPaied
  attr_accessor :is_paied
  
  def init_paied(is_paied='')
    if id.blank?
      @is_paied=nil
    else
      @is_paied=is_paied
    end
  end

  def all_pay_status?
    @is_paied.blank?
  end
  
end