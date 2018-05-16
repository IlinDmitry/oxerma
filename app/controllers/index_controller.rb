class IndexController < ApplicationController
  def index
    @tickets = Ticket.limit 9
  end
end
