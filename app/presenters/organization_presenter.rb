class OrganizationPresenter < ApplicationPresenter
  def full_name
    "\"#{model.category}\" #{model.name}"
  end
end