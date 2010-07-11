module OrdersHelper
  def customer_unpaied_list
    rlt = {}
    @orders.each do |o|
      if o.is_paied == 'no'      
        rlt[o.customer.name]||=0
        rlt[o.customer.name]+=o.totale
      end
    end
    rlt
  end
end
