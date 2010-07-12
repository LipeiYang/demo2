module OrdersHelper

  def customer_unpaied_list
    rlt = {}
    @orders.each do |o|
      if o.is_paied == 'no'      
        rlt[o.customer.name]||=0
        rlt[o.customer.name]+=o.totale
      end
    end
    rlt.sort{|a,b| a[1]<=>b[1]}
  end
  
  def product_position_list
    rlt = {}
    @orders.each do |o|
      if o.material_fee > 0      
        rlt[o.product.name]||=0
        rlt[o.product.name]+=o.material_fee
      end
    end
    rlt.sort{|a,b| a[1]<=>b[1]}
  end
end
