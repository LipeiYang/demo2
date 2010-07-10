# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

[ { :name => 'A3', :price => 4.8 },
  { :name => '中碳', :price => 5 },
  { :name => '氯12', :price => 14 },
  { :name => '42ln', :price => 8 } ].each do |p|    
  Product.find_or_create_by_name p    
end

