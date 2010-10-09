class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments
  
  def to_s
    name
  end
end
