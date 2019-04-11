class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    if signed_in?
      @admin = Admin.find_by(user_id:current_user.id)
      @agent = Agent.find_by(user_id:current_user.id)
      if @admin
        @tickets = Ticket.all
      else
        @tickets = Ticket.where(agent_id:@agent.id)
      end
    else
      redirect_to sign_in_path
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    if signed_in?
      @admin = Admin.find_by(user_id:current_user.id)
      @agent = Agent.find_by(user_id:current_user.id)
      if @agent and Ticket.find(params[:id]).agent_id!=@agent.id
        redirect_to :action => "index"
      end
    else
      redirect_to sign_in_path
    end
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.find_by(email:ticket_params[:email])
    if @ticket
      @ticket.comments.create(comment:ticket_params[:text])
    else
      @ticket = Ticket.new(ticket_params)
    end

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_update_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:email, :text, :agent_id)
    end
    def ticket_update_params
      params.permit(:email, :text, :agent_id)
    end
end
