class User < ApplicationRecord
  has_secure_password

  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {self.email.downcase!}

  validates :email,
            length: {maximum: 50},
            format: {with: REGEX_EMAIL},
            uniqueness: {case_sensitive: false},
            presence: true

  validates :password,
            length: {minimum: 8},
            presence: true
end
