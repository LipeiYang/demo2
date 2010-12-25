module CustomersHelper
  
  def total_amount_will_receive
    @customers.sum(&:amount_will_receive)
  end
  
  def set_alert(customer)
    alert = ''
    if customer.long_time_no_trade?
      alert += customer_idle_html
      if customer.unsettle?
        alert += customer_idle_unsettle_html
      end
    end
    alert
  end
  
  def customer_idle_html
    '<b class = "customer_idle">&bull;</b>'
  end
  
  def customer_idle_unsettle_html
    '<b class = "customer_idle_unsettle">&bull;</b>'
  end
end
