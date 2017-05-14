#Al migrar a Rails4 en alectrico, no me funcionaron más los formularios anidados pro el error
#undefined method `link_to_function' for

#Este metodo es llamado desde los helpers de applicacion

#Las solución consiste en;

#http://stackoverflow.com/questions/5063246/rails-3-status-of-link-to-function-method

#he link_to_function helper has been deprecated again in 3.2.4.

#he method itself is quite simply and good in some use cases when you need to call specific javascript function etc. You can easily add your own helper to achieve the same functionality. The following code was copied from Jeremy in https://github.com/rails/rails/pull/5922#issuecomment-5770442

module LinkToFunctionHelper
  def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end
end
