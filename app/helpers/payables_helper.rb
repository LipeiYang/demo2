module PayablesHelper
  def supplier_unpay_list
    rlt = {}
    @unpaid_purchases.each do |o|
      rlt[o.supplier.name]||=0
      rlt[o.supplier.name]+=o.total
    end
    @payables.each do |o|
      rlt[o.supplier.name]||=0
      rlt[o.supplier.name]-=o.amount
    end
    rlt.sort_by{|a| -a[1]}
  end
  
  def total_unpay
    @unpaid_purchases.to_a.sum {|o| o.total} - @payables.to_a.sum {|o| o.amount}
  end
end
