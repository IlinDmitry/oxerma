class User < ApplicationRecord
  rolify
  has_secure_password

  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {self.email.downcase!}

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
            unless: lambda{password.nil?},
            on: :update
end
