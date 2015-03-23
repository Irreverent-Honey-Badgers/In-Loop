class AppointmentController < ApplicationController

  def index
    @appointments = Event.all
    @event = Event.new
  end

  def new
    
  end

end
