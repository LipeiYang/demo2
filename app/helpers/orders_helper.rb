module OrdersHelper

  def total_profit
    total_revenue-(@end_date-@start_date+1)*370
  end

  def total_revenue
    total_material_fee-total_material_cost+total_manfee
  end

  def total_material_fee
    @orders.inject(0) { |sum,order| sum += order.material_fee }
  end

  def total_material_cost
    @orders.inject(0) { |sum,order| sum += order.material_cost }
  end

  def total_manfee
    @orders.inject(0) { |sum,order| sum += order.manfee }
  end
  
  def total_paied
    @orders.inject(0) { |sum,order| if order.is_paied.eql?('yes')
                                      sum += order.totale 
                                    else 
                                      sum += 0 
                                    end 
                                  }
  end
  
  def total_unpaied
    @orders.inject(0) { |sum,order| if order.is_paied.eql?('no')
                                      sum += order.totale 
                                    else 
                                      sum += 0 
                                    end 
                                  }
  end
  
  def total
    @orders.inject(0) { |sum,order| sum += order.totale }
  end
  
  def customer_unpaied_list
    rlt = {}
    @orders.each do |o|
      if o.is_paied == 'no'      
        rlt[o.customer.name]||=0
        rlt[o.customer.name]+=o.totale
      end
    end
    rlt.sort_by{|a| -a[1]}
  end
    
  def product_position_list
    rlt = {}
    @orders.each do |o|
      if o.material_fee > 0      
        rlt[o.product.name]||={:total_mat_fee=>0, :total_volume=>0, :total_cost=>0, :total_profit=>0}
        rlt[o.product.name][:total_mat_fee]+=o.material_fee
        rlt[o.product.name][:total_volume]+=o.volume
        rlt[o.product.name][:total_cost]+=o.material_cost
        rlt[o.product.name][:total_profit]+=o.material_fee-o.material_cost
      end
    end
    rlt.sort_by{|a| -a[1][:total_profit]}
  end
  
  def customer_position_list
    rlt = {}
    @orders.each do |o|
      rlt[o.customer.name]||= {:total_mat_fee=>0, :total_mat_profit=>0, :total_man_fee=>0, :total_profit=>0}
      rlt[o.customer.name][:total_mat_fee]+=o.material_fee
      rlt[o.customer.name][:total_mat_profit]+=o.material_fee-o.material_cost
      rlt[o.customer.name][:total_man_fee]+=o.manfee
      rlt[o.customer.name][:total_profit]+=o.totale-o.material_cost
    end
    rlt.sort_by{|a| -a[1][:total_profit]}
  end
end
