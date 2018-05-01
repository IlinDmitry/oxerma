module Attributable::Biography
  extend ActiveSupport::Concern

  included do
    validates :biography,
              length: {maximum: 500}
  end
end