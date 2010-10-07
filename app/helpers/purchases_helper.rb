module PurchasesHelper
  
  def total_purchase_paied
    @purchases.sum { |purchase| purchase.is_paied.eql?(YES) ? purchase.total : 0 }
  end
  
  def total_purchase_unpaied
    @purchases.sum { |purchase| purchase.is_paied.eql?(NO) ? purchase.total : 0}
  end
  
  def total_purchase_fee
    @purchases.sum(&:total) 
  end
  
  def product_purchase_list
    rlt = {}
    @purchases.each do |o|
      if o.total > 0      
        rlt[o.product.name]||={:total_volume=>0, :total_amount=>0}
        rlt[o.product.name][:total_volume]+=o.volume
        rlt[o.product.name][:total_amount]+=o.total
      end
    end
    rlt.sort_by{|a| -a[1][:total_amount]}
  end
  
  def supplier_purchase_list
    rlt = {}
    @purchases.each do |o|
      rlt[o.supplier.name]||={:paied_amount=>0, :total_amount=>0}
      rlt[o.supplier.name][:paied_amount]+=o.total if o.is_paied.eql?(YES)
      rlt[o.supplier.name][:total_amount]+=o.total
    end
    rlt.sort_by{|a| -a[1][:total_amount]}    
  end
  

end
