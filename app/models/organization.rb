class Organization < ApplicationRecord
  include CarrierwaveConcern
  include Attributable::Email
  include Attributable::Phone
  include Attributable::Biography

  enum category: [:undefined, :legal, :individual]

  resourcify

  has_many :employes
  has_many :users,
           through: :employes,
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
