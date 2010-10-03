class AddCutoffToSupplier < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :cutoff_date, :date
    add_column :suppliers, :unpaid_amount, :integer, :defaut=>0
  end

  def self.down
    remove_column :suppliers, :cutoff_date
    remove_column :suppliers, :unpaid_amount
  end
end
