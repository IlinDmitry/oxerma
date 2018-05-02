class Organization < ApplicationRecord
  include CarrierwaveConcern
  include Attributable::Email
  include Attributable::Phone
  include Attributable::Biography

  enum category: {undefined: 0, legal: 1, individual: 2}

  resourcify

  has_many :users_organizations
  has_many :users,
           through: :users_organizations,
           dependent: :destroy
  has_many :tickets, as: :ticketable

  validates :psrn,
            numericality: {only_integer: true},
            uniqueness: true,
            presence: true
  validates :name,
            presence: true
  validates :category,
            presence: true
end
