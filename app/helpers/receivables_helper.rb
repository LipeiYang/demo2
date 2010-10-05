module ReceivablesHelper
  
  def customer_unrec_list
    rlt = {}
    @unpaid_orders.each do |o|
      rlt[o.customer.name]||=0
      rlt[o.customer.name]+=o.total
    end
    @receivables.each do |o|
      rlt[o.customer.name]||=0
      rlt[o.customer.name]-=o.amount
    end
    rlt.sort_by{|a| -a[1]}
  end
  
  def total_unrec
    @unpaid_orders.to_a.sum(&:total)-@receivables.to_a.sum(&:amount)
  end
end
