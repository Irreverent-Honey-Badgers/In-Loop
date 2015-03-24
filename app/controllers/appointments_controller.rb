class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    @event = Appointment.new
  end

  def new
    @event = Appointment.new
  end

  def delete_successful_appointment
    binding.pry
  end


end
