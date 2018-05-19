class IndexController < ApplicationController
  def index
    @tickets = Ticket.order(updated_at: :desc).limit 9
  end
end
