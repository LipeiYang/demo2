module CostItemsHelper

  def period_hash
    { t(:day) => 1, t(:month) => 30, t(:year) => 365 }
  end

  def day_to_period
    period_hash.invert
  end


end
