class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show edit update destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(:user).page(params[:page]).per(3)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comments = @event.comments.order(:created_at).page(params[:page]).per(10)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(title: event_params[:title],
                       body: eval(event_params[:body]),
                       place: event_params[:place],
                       user_id: event_params[:user_id],
                       date_from: event_params[:date_from],
                       date_to: event_params[:date_to],
                       visible: event_params[:visible])

    respond_to do |format|
      if @event.save
        NotifierService.call(@event)

        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(title: event_params[:title],
                       body: eval(event_params[:body]),
                       place: event_params[:place], user_id:
                       event_params[:user_id],
                       date_from: event_params[:date_from],
                       date_to: event_params[:date_to],
                       visible: event_params[:visible])

        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :body, :user_id, :place, :date_from, :date_to, :visible)
  end
end
