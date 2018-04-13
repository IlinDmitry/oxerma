class Organization < ApplicationRecord
  resourcify

  has_many :users_organizations
  has_many :users,
           through: :users_organizations,
           dependent: :destroy
  belongs_to :organization_type,
             foreign_key: :type_id

  validates :name,
            presence: true
  validates :type_id,
            presence: true
  validates :email,
            presence: true
  validates :phone,
            presence: true
  validates :biography,
            length: {maximum: 500}
end
