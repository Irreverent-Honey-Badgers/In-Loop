class AppointmentController < ApplicationController

  def index
    @appoins = Event.all
    @event = Event.new
  end

end
