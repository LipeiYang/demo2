module Modules::Criteria::TermPaied
  attr_accessor :is_paied
  
  def init_paied(is_paied=nil)
    if id.blank?
      @is_paied=nil
    else
      @is_paied=is_paied
    end
  end
  
  def self.all?(id)
    id.blank?
  end
  
  def self.all
    nil
  end

end