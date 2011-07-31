module DialogHelper
  # Returns JS code which shows popup dialog using jQuery UI (expects jQuery and jQuery
  # UI to be loaded in advance). Valid +options+ can be found in jQuery UI docs.
  # 
  # Usage:
  # 
  #  update_page do |page|
  #    page << dialog(:html => html_string)
  #    page << dialog(:selector => css_selector)
  #  end
  #
  def dialog(content, options = {})
    events = ["open", "close", "before_close"]

    options.stringify_keys!
    options.each do |key, value|
      if [Symbol, Array].include?(value.class)
        options[key] = array_or_string_for_javascript(value)
      elsif value.is_a?(String) && ! events.include?(key)
        options[key] = array_or_string_for_javascript(escape_javascript(value))
      end
    end
    
    options = {
      :modal => true,
      :resizable => false,
      :draggable => false }.merge(options)

    selector = content[:selector]
    html = content[:html]
    
    open = options.delete("open")
    before_close = options.delete("before_close")
    close = options.delete("close")

    if open
      options[:open] = "function(event, ui) { #{open}; $('#overlay-spinner').remove(); }"
    else
      options[:open] = "function(event, ui) { $('#overlay-spinner').remove(); }"
    end

    if html && selector
      options[:close] = <<-END.strip
        function(event, ui) { #{before_close}; jQuery('#{selector}').hide(); #{close} }
      END

      <<-END.strip
        jQuery('#{selector}').html('#{escape_javascript(html)}').dialog(#{options_for_javascript(options)}).show();
      END
    elsif html
      options[:close] = <<-END.strip
        function(event, ui) { #{before_close}; jQuery('#' + div.id).dialog('destroy'); jQuery(div).remove(); #{close} }
      END

      <<-END.strip
        jQuery.fn.identify = function(prefix) {
          var i = 0;
          return this.each(function() {
            if($(this).attr('id')) return;
            do { 
              i++;
              var id = prefix + '_' + i;
            } while($('#' + id).length > 0);            
              $(this).attr('id', id);            
          });
        };
        var div = document.createElement('div');
        jQuery(div).identify();
        jQuery(div).append('#{escape_javascript(html)}').dialog(#{options_for_javascript(options)});
      END
    elsif selector
      options[:close] = "function(event, ui) { #{before_close}; #{close}; }" if close || before_close

      "jQuery('#{selector}').dialog(#{options_for_javascript(options)})"
    end
  end

  def hide_dialog(selector = nil)
    if selector
      <<-END.strip
        var o = jQuery('#{selector}');
        if (o.hasClass('ui-dialog-content'))
          o.dialog('close');
        else
          o.parents('.ui-dialog-content').dialog('close');
      END
    else
      <<-END.strip
        var o = jQuery(this);
        if (o.hasClass('ui-dialog-content'))
          o.dialog('close');
        else
          o.parents('.ui-dialog-content').dialog('close');
      END
    end
  end

  def hide_dialog_button(label = "Cancel", selector = nil, html_options = {})
    function = hide_dialog(selector)
    link_to_function label, function, html_options
  end
end
