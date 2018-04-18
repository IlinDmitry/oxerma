class OrganizationType < ApplicationRecord
  has_one :organization

  validates :name,
            uniqueness: {
                case_sensitive: false
            },
            presence: true
end
