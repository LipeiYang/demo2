class AddTelPhMobPhToCustomerSupplier < ActiveRecord::Migration
  def self.up
    add_column :customers, :telph, :string
    add_column :suppliers, :telph, :string

    add_column :customers, :mobph, :string
    add_column :suppliers, :mobph, :string
  end

  def self.down
    remove_column :customers, :telph
    remove_column :suppliers, :telph
    
    remove_column :customers, :mobph
    remove_column :suppliers, :mobph
  end
end
