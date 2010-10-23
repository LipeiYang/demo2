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

