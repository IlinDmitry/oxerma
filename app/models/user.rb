class User < ApplicationRecord
  include CarrierwaveConcern
  include Attributable::Email
  include Attributable::Phone
  include Attributable::Biography

  rolify
  has_secure_password

  attr_accessor :virtual_role
  attr_accessor :skip_after_create_assign_role

  before_destroy do
    if has_dependencies?
      errors.add(:base, "Cannot delete record because dependent exist")
      throw(:abort)
    end
  end

  has_many :users_organizations
  has_many :organizations,
           through: :users_organizations,
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
    users_organizations.any?
  end
end
