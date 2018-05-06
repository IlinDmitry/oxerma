class Ticket < ApplicationRecord
  include CarrierwaveConcern

  enum signature_price: [:rub, :byn, :usd, :eur]
  enum signature_qty: [:unit, :gram, :kilogram, :ton, :milliliter, :litre]

  resourcify

  belongs_to :ticketable,
             polymorphic: true

  validates :title,
            presence: true
  validates :biography,
            length: {maximum: 500}
  validates :price,
            presence: true
  validates :signature_price,
            presence: true
  validates :qty,
            numericality: {greater_than_or_equal_to: 1}
  validates :signature_qty,
            presence: true
end
