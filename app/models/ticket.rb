class Ticket < ApplicationRecord
  include CarrierwaveConcern

  scopify

  belongs_to :ticketable,
             polymorphic: true

  validates :title,
            presence: true
  validates :biography,
            length: {maximum: 500}
  validates :price,
            presence: true
  validates :signature_price,
            numericality: {greater_than_or_equal_to: 0},
            presence: true
  validates :qty,
            numericality: {greater_than_or_equal_to: 1}
  validates :signature_qty,
            numericality: {greater_than_or_equal_to: 1}

end
