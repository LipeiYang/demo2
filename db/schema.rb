# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101005155338) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cost_items", :force => true do |t|
    t.integer  "seq_no"
    t.string   "name"
    t.float    "price"
    t.integer  "period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seq_no"
    t.date     "cutoff_date"
    t.float    "inreceive_amount"
  end

  create_table "invests", :force => true do |t|
    t.integer  "seq_no"
    t.date     "date"
    t.integer  "cost_item_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.date     "date"
    t.float    "price",       :default => 0.0
    t.float    "volume",      :default => 0.0
    t.float    "manfee",      :default => 0.0
    t.integer  "customer_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "is_paied"
    t.integer  "seq_no"
  end

  create_table "payables", :force => true do |t|
    t.integer  "seq_no"
    t.date     "date"
    t.integer  "supplier_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.date     "date"
    t.integer  "product_id"
    t.float    "price",       :default => 0.0
    t.float    "volume",      :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seq_no"
    t.integer  "supplier_id"
    t.string   "is_paied"
  end

  create_table "receivables", :force => true do |t|
    t.integer  "seq_no"
    t.date     "date"
    t.integer  "customer_id"
    t.float    "amount",      :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.integer  "seq_no"
    t.string   "name",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "cutoff_date"
    t.integer  "unpaied_amount"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "name"
    t.string   "address"
    t.string   "telephone"
    t.string   "cell_phone"
    t.string   "id_no"
    t.string   "business_no"
    t.string   "company"
    t.text     "addtional"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

end
