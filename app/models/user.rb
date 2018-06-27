class User < ApplicationRecord
  include CarrierwaveConcern
  include Attributable::Email
  include Attributable::Phone
  include Attributable::Biography

  rolify
  has_secure_password

  before_destroy do
    if has_dependencies?
      errors.add(:base, "Cannot delete record because dependent exist")
      throw(:abort)
    end
  end

  has_many :employes
  has_many :organizations,
           through: :employes,
           dependent: :destroy
  has_many :tickets, as: :ticketable

  validates :first_name,
            length: {maximum: 25}
  validates :last_name,
            length: {maximum: 25}
  validates :password,
            length: {minimum: 8},
            on: :create
  validates :password,
            length: {minimum: 8},
            unless: lambda {password.nil?},
            on: :update

  def has_dependencies?
    employes.any?
  end
end
