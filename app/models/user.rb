class User < ActiveRecord::Base
  acts_as_authentic do |c| 
    c.validate_email_field = false 
  end 
  
  def db_schema
    "leaf_#{username}"
  end
end
