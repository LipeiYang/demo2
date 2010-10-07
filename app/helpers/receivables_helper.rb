module ReceivablesHelper
  
  def customer_unrec_list
    rlt = {}
    @receivables.each do |o|
      rlt[o.customer.name]||=0
      rlt[o.customer.name]+=o.amount
    end
    rlt.sort_by{|a| -a[1]}
  end
  
  def total_unrec
    @receivables.sum(&:amount)
  end
end
