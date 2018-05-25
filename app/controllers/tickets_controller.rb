class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] {authorize @ticket}
  before_action only: [:index, :new, :create, :show] {authorize Ticket}

  # GET /tickets
  def index
    @tickets = Ticket.order(updated_at: :desc).all
    render :index, locals: {tickets: @tickets}
  end

  # GET /tickets/1
  def show
    render :show, locals: {ticket: @ticket}
  end

  # GET /tickets/new
  def new
    render :new, locals: {ticket: Ticket.new}
  end

  # GET /tickets/1/edit
  def edit
    render :edit, locals: {ticket: @ticket}
  end

  # POST /tickets
  def create
    ticketable = ticketable_params
    case ticketable['ticketable_type'].downcase.to_sym
      when :user
        @ticketable = current_user
      when :organization
        # TODO: добавить проверку существования организации
        organization = Organization.find ticketable['ticketable_id'].to_i
        @ticketable = current_user.has_cached_role?(:admin, organization) ? organization : nil
      else
        raise ArgumentError
    end
    # TODO: существует ли инстансная переменная @ticketable?
    @ticket = @ticketable.tickets.build ticket_params.merge(ticketable)
    begin
      @ticket.save!
      current_user.add_role :admin, @ticket
      redirect_to @ticket, flash: {notice: 'Ticket was successfully created.'}
    rescue
      render :new, locals: {ticket: @ticket}
    end
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

  def ticketable_params
    ticketable = params[:ticket][:ticketable]
                     .match(/^(?<ticketable_type>\w+):(?<ticketable_id>\d+)$/)
                     .named_captures
    params[:ticket].delete :ticketable
    ticketable
  end

  def ticket_params
    params.require(:ticket).permit :title, :biography, :image, :remove_image, :price, :signature_price, :qty, :signature_qty, :ticketable
  end
end
