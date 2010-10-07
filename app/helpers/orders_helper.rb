module OrdersHelper

  def total_profit
    total_revenue-@criteria_order.days*everyday_cost
    
  end

  def everyday_cost
    CostItem.all.sum(&:day_cost)
  end

  def total_revenue
    total_material_fee-total_material_cost+total_manfee
  end

  def total_material_fee
    @orders.sum(&:material_fee)
  end

  def total_material_cost
    @orders.sum(&:material_cost)
  end

  def total_manfee
    @orders.sum(&:manfee)
  end
  
  def total_paied
    @orders.sum { |order| order.is_paied.eql?(YES) ? order.total : 0}
  end
  
  def total_unpaied
    @orders.sum { |order| order.is_paied.eql?(NO) ? order.total : 0}
  end
  
  def total
    @orders.sum(&:total)
  end
  
  def product_position_list
    rlt = {}
    @orders.each do |o|
      rlt[o.product.name]||={:total_volume=>0, :total_mat_fee=>0, :total_mat_profit=>0, :total_man_fee=>0, :total_profit=>0}
      rlt[o.product.name][:total_volume]+=o.volume
      rlt[o.product.name][:total_mat_fee]+=o.material_fee
      rlt[o.product.name][:total_mat_profit]+=o.material_fee-o.material_cost
      rlt[o.product.name][:total_man_fee]+=o.manfee
      rlt[o.product.name][:total_profit]+=o.material_fee-o.material_cost+o.manfee
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
      rlt[o.customer.name][:total_profit]+=o.total-o.material_cost
    end
    rlt.sort_by{|a| -a[1][:total_profit]}
  end
  
  def alert?(order)
    order.customer.id==1&&order.is_paied=='no'
  end
end
