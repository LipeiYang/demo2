require 'activerecord_toolbox'
class ReceivableFilter < ActiveRecord::TableLessBase
  column :d_from, :date, Date.today-1.month
  column :d_to, :date, Date.today
  column :i_customer, :integer
  
end
