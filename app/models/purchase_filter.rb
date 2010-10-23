require 'activerecord_toolbox'
class PurchaseFilter < ActiveRecord::TableLessBase
  column :d_from, :date, Date.today-7.day
  column :d_to, :date, Date.today
  column :i_supplier, :integer
  column :i_product, :integer
  column :s_paid, :string
  
end
