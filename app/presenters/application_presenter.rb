require 'delegate'

class ApplicationPresenter < SimpleDelegator
  def present_created_at(format = '%Y-%m-%d')
    model.created_at.strftime format
  end

  def present_updated_at(format = '%Y-%m-%d')
    model.updated_at.strftime format
  end

  def model
    __getobj__
  end
end
