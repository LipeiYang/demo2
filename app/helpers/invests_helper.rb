module InvestsHelper
  def total_invest
    @invests.sum(&:amount)
  end
end
