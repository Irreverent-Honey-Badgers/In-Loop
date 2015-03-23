class AppointmentController < ApplicationController

  def index
    @appointments = Appointment.all
    @event = Appointment.new
  end

  def new
    @event = Appointment.new
  end

end
