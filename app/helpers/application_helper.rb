module ApplicationHelper
  def present(object)
    lambda = -> (e) {"#{e.class}Presenter".constantize.new e}
    return lambda.call(object) unless block_given?
    object.each do |model|
      yield lambda.call model
    end
  end

  def enum_selection(hash)
    hash.keys.each_with_object([]) do |item, memo|
      memo << [item, item]
    end
  end

  def ticketable_selection
    selection = [[current_user.email, "#{current_user.class}:#{current_user.id}"]]
    organizations = current_user.organizations.each_with_object([]) do |model, storage|
      storage << [model.name, "#{model.class}:#{model.id}"]
    end
    selection.concat(organizations) if organizations.present?
    selection
  end

  def link_class_active(target_link)
    'active' if current_page? target_link
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        'alert-success'
      when :error
        'alert-danger'
      when :alert
        'alert-warning'
      when :notice
        'alert-info'
      else
        flash_type
    end
  end
  def title(text)
    content_for :title, text
  end
end
