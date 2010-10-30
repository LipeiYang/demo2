# Methods added to this helper will be available to all templates in the application.
require 'rails_extensions'
module ApplicationHelper
  
  def f(num)
    h number_with_precision(num, :precision => 2, :separator => ".")
  end
  
  def ft(t)
    t.strftime('%y-%m-%d %H:%M')
  end
  
  def title(page_title)  
    content_for(:title) { t(page_title) }  
  end

  def render_new_link(name, url)
    render :partial => "partials/new_link_facade", :locals =>{ :content => link_to(t(name), url) }
  end
  
  def render_edit_link(url)
    render :partial => "partials/edit_link_facade", :locals =>{ :content => link_to(t('Edit'), url) }
  end

  def render_delete_link(url)
    render :partial => "partials/delete_link_facade", :locals =>{ :content => 
      link_to(t('Destroy'), url, :confirm => t('sure?'), :method => :delete) }
  end

  def render_edit_link(url, name='Edit')
    render :partial => "partials/edit_link_facade", :locals =>{ :content => link_to(t(name), url) }
  end
  
  def render_filter(filter_form)
    render :partial => "partials/filter_facade", :locals =>{ :content => render(:partial => filter_form) }
  end
end
