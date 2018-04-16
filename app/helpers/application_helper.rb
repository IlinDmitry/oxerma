module ApplicationHelper
  def present(object)
    lambda = -> (e) {"#{e.class}Presenter".constantize.new e}
    return lambda.call(object) unless block_given?
    object.each do |model|
      yield lambda.call model
    end
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
end
