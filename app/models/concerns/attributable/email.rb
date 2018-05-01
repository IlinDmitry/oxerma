module Attributable::Email
  extend ActiveSupport::Concern

  included do
    validates :email,
              length: {maximum: 50},
              uniqueness: {case_sensitive: false},
              email_format: true,
              presence: true
  end
end