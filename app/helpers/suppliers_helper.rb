module SuppliersHelper
  def total_amount_to_pay
    @suppliers.sum(&:amount_to_pay)
  end
end
