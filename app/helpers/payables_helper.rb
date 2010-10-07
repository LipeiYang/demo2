module PayablesHelper
  def supplier_unpay_list
    rlt = {}
    @payables.each do |o|
      rlt[o.supplier.name]||=0
      rlt[o.supplier.name]+=o.amount
    end
    rlt.sort_by{|a| -a[1]}
  end
  
  def total_unpay
    @payables.sum(&:amount)
  end
end
