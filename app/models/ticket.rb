class Ticket < ApplicationRecord
  include CarrierwaveConcern

  belongs_to :ticketable, polymorphic: true

end
