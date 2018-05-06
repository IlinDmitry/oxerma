module TicketsHelper
  def ticket_signature_price_selection
    enum_selection Ticket.signature_prices
  end

  def ticket_signature_qties_selection
    enum_selection Ticket.signature_qties
  end
end