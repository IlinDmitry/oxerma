require 'delegate'

class ApplicationPresenter < SimpleDelegator
  def model
    __getobj__
  end
end
