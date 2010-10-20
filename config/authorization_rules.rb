authorization do  
  role :admin do  
    has_permission_on [:users], :to => :all  
  end
  
  role :user do  
    has_permission_on [:account], :to => [:edit, :update_password]  
  end
end  

privileges do
  privilege :all do
    includes :index, :show, :new, :create, :edit, :update, :destroy
  end
end