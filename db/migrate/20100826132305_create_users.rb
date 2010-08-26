class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :name
      t.string :address
      t.string :telephone
      t.string :cell_phone
      t.string :id_no
      t.string :business_no
      t.string :company
      t.text :addtional

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
