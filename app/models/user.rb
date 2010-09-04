class User < ActiveRecord::Base
  has_many :assignments
  has_many :roles, :through => :assignments
  
  acts_as_authentic do |c| 
    c.validate_email_field = false 
    # c.logged_in_timeout = 10.minutes
  end 
  
  def db_schema
    "leaf_#{username}"
  end
  
  def role_symbols  
    roles.map do |role|  
      role.name.underscore.to_sym  
    end  
  end
  
  def admin?
    role_symbols.include?(:admin)
  end
end
