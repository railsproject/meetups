class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @meetup =Meetup.find(params[:meetup_id])
    @events = @meetup.events.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
      @meetup =Meetup.find(params[:meetup_id])
      @event  = @meetup.events.find(params[:id])
      @joinevent=Userevent.where("user_id = ? AND event_id = ?",session[:user_id],params[:id]).exists? 
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json

    
  def create
    @meetup=Meetup.find(params[:meetup_id])
    @event =@meetup.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to meetup_event_path(@meetup,@event), notice: 'Event was successfully created.' }
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
    @meetup=Meetup.find(params[:meetup_id])
    @event =@meetup.events.find(params[:id])
 
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to meetup_event_path(@meetup,@event), notice: 'Event was successfully updated.' }
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
    @meetup=Meetup.find(params[:meetup_id])
    @event =@meetup.events.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to meetup_events_path(@meetup), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @meetup=Meetup.find(params[:meetup_id]) 
    @event =@meetup.events.find(params[:id]) 
   
    
    @userevent = Userevent.new(event_id:params[:id],  user_id:  session[:user_id])
    respond_to do |format|
      @userevent.save
      format.html { redirect_to meetup_event_path(@meetup,@event) }
       
  end
  end
def listevent
@meetup=Meetup.find(params[:meetup_id]) 
    
@events = Event.where("date >= ? AND meetup_id =?", params[:date]+' 00:00:00',@meetup)

render 'events/index' #meetup_events_path(@meetup) 
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :body, :date, :meetup_id)
    end
end
