class User < ApplicationRecord
  has_secure_password

  LENGTH_MAXIMUM_EMAIL = 50
  LENGTH_MINIMUM_PASSWORD = 8

  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {self.email.downcase!}

  validates :email,
            length: {maximum: LENGTH_MAXIMUM_EMAIL},
            format: {with: REGEX_EMAIL},
            uniqueness: {case_sensitive: false},
            presence: true

  validates :password,
            length: {minimum: LENGTH_MINIMUM_PASSWORD},
            on: :create

  validates :password,
            length: {minimum: LENGTH_MINIMUM_PASSWORD},
            unless: lambda{password.nil?},
            on: :update
end
