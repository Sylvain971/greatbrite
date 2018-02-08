class EventsController < ApplicationController
  
  def index
  	@events = Event.all
  end

  def new
  	@event = Event.new
  end


  def show
  	@event = Event.find(params[:id])
  end


  def create
  	   @event = Event.new(event_params)
   	   @event.creator = current_user
       @event.save
       p "erreurs :"
       @event.errors.each {|e| p e}
       p "fin des erreurs"
       flash[:success] = "évènement créé !"
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
 
  	redirect_to events_path
  end


	private
  def event_params
    params.permit(:title, :description, :date, :place)
  end

end

