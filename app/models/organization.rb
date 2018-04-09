class Organization < ApplicationRecord
  resourcify

  has_many :users_organizations
  has_many :users,
           through: :users_organizations

  validates :title,
            presence: true
  validates :description,
            presence: true
end
