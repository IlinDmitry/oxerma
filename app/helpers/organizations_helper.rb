module OrganizationsHelper
  def organization_category_selection
    Organization.categories.keys.each_with_object([]) do |item, storage|
      storage << [item, item]
    end
  end
end
