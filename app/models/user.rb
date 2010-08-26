class User < ActiveRecord::Base
  acts_as_authentic { |c| c.validate_email_field = false }
  
  def db_schema
    "leaf_#{username}"
  end
end
