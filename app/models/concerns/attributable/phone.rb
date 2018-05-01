module Attributable::Phone
  extend ActiveSupport::Concern

  included do
    validates :phone,
              phone_format: true,
              presence: true
  end
end