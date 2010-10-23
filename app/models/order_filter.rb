require 'activerecord_toolbox'
class OrderFilter < ActiveRecord::TableLessBase
  column :d_from, :date, Date.today-1.day
  column :d_to, :date, Date.today
  column :i_customer, :integer
  column :i_product, :integer
  column :s_paid, :string
  
  def profit_calculable?
    i_customer==nil&&i_product==nil&&s_paid==''
  end
  
  def days
    d_to-d_from+1
  end
  
end
