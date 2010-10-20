module ActionView
  module Helpers
    class FormBuilder
      def text_field_hl(method, options = {})
        h = {:onclick=>"javascript: this.focus(); this.select();"}
        text_field(method, options.merge!(h))
      end
      
      def submit_once(method, options = {})
        h = {:onclick=>"javascript: this.disabled=true; this.form.submit();"}
        submit(method, options.merge!(h))
      end
    end
  end
end

module ActiveRecord
  class TableLessBase < ActiveRecord::Base
    
    def self.columns() @columns ||= []; end  
  
    def self.column(name, sql_type = nil, default = nil, null = true)  
      columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)  
    end  
    
  end 
end