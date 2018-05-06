module OrganizationsHelper
  def organization_category_selection
    enum_selection Organization.categories
  end
end
