class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save!
    redirect_to @ticket, notice: 'Ticket was successfully created.'
  rescue
    render :new
  end

  # PATCH/PUT /tickets/1
  def update
    @ticket.update! ticket_params
    redirect_to @ticket, notice: 'Ticket was successfully updated.'
  rescue
    render :new
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy!
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  rescue ActiveRecord::RecordNotDestroyed => e
    redirect_to @ticket, flash: {alert: e.message}
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end


  def ticket_params
    params.require(:ticket).permit :title, :biography, :image, :remove_image, :price, :signature_price, :qty, :signature_qty
  end
end
