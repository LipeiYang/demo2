class User < ActiveRecord::Base
  acts_as_authentic do |c| 
    c.validate_email_field = false 
    # c.logged_in_timeout = 10.minutes
  end 
  
  def db_schema
    "leaf_#{username}"
  end
end
