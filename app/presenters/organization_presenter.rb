class OrganizationPresenter < ApplicationPresenter
  def full_name
    "\"#{model.organization_type.name}\" #{model.name}"
  end
end