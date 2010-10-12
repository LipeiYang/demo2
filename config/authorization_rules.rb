authorization do  
  role :admin do  
    has_permission_on [:users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]  
  end
  
  role :user do  
    has_permission_on [:account], :to => [:edit, :update_password]  
  end
  
end  