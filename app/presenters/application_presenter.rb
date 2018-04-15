require 'delegate'

class ApplicationPresenter < SimpleDelegator
  def date_created_at(format = '%Y-%m-%d')
    model.created_at.strftime format
  end

  def model
    __getobj__
  end
end