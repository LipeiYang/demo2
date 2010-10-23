# Methods added to this helper will be available to all templates in the application.
require 'rails_extensions'
module ApplicationHelper
  
  def f(num)
    h number_with_precision(num, :precision => 2, :separator => ".")
  end
  
  def ft(t)
    t.strftime('%y-%m-%d %H:%M') unless t==nil
  end
  
  def title(page_title)  
    content_for(:title) { page_title }  
  end
    
end
