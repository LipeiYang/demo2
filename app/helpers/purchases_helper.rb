module PurchasesHelper
  def product_purchase_list
    rlt = {}
    @purchases.each do |o|
      if o.total > 0      
        rlt[o.product.name]||=0
        rlt[o.product.name]+=o.total
      end
    end
    rlt.sort_by{|a| -a[1]}
  end
end
