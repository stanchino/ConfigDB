module ApplicationHelper
  def root_url
    if current_user
      authenticated_root_url
    else
      unauthenticated_root_url
    end
  end

  def no_autocomplete_simple_form_for(resource, options={}, &block)
    if options[:html]
      options[:html][:autocomplete] = 'off'
    else
      options[:html] = {autocomplete: 'off'}
    end
    simple_form_for(resource, options, &block)
  end

  def prepend_input(builder, resource, icon, options={})
    render partial: 'shared/prepend_input', locals: {builder: builder, resource: resource, icon: icon, options: options}
  end
end
