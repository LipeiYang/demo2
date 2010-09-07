module CostItemsHelper

  def period_hash
    { t(:per_day) => 1, t(:per_month) => 30, t(:per_year) => 365 }
  end

  def day_to_period
    period_hash.invert
  end


end
