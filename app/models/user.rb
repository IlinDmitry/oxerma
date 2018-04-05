class User < ApplicationRecord
  rolify
  has_secure_password

  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :virtual_role

  after_create :assign_role

  validates :email,
            length: {maximum: 50},
            format: {with: REGEX_EMAIL},
            uniqueness: {case_sensitive: false},
            presence: true

  validates :phone,
            length: {maximum: 15}

  validates :first_name,
            length: {maximum: 25}

  validates :middle_name,
            length: {maximum: 25}

  validates :last_name,
            length: {maximum: 25}

  validates :biography,
            length: {maximum: 500}

  validates :password,
            length: {minimum: 8},
            on: :create

  validates :password,
            length: {minimum: 8},
            unless: lambda {password.nil?},
            on: :update

  validates :virtual_role,
            inclusion: {in: %w(consumer producer)},
            unless: lambda {self.virtual_role.blank?},
            on: :create,
            presence: true

  private

  def assign_role
    add_role self.virtual_role || 'default'
  end
end
