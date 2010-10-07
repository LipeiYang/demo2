module CustomersHelper
  def total_amount_will_receive
    @customers.sum(&:amount_will_receive)
  end
end
