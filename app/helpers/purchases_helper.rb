module PurchasesHelper
  
  def total_material_fee
    @purchases.inject(0) { |sum,purchase| sum += purchase.total }
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
end
