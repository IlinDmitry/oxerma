class OrganizationType < ApplicationRecord
  has_one :organization

  validates :name,
            presence: true
end
