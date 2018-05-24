class IndexController < ApplicationController
  def index
    tickets = Ticket.order(updated_at: :desc).limit 9
    render :index, locals: {tickets: tickets}
  end
end
