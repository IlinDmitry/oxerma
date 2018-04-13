class OrganizationType < ApplicationRecord
  validates :name,
            presence: true
end
