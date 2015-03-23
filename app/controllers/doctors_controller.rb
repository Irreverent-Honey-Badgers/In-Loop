class DoctorsController < ApplicationController
  # before_action :authenticate_doctor!

  def index
    @doctors = Doctor.all
  end

  def show
    :authenticate_doctor!
  end

  def get_patient
    # binding.pry
    @doctor = Doctor.find(params[:id])
    @appointments = @doctor.appointments.where("start_datetime > ?", DateTime.now)
    # mypatients = Doctor.find(params[:id]).patients
    # @patient = mypatients
    render :json => @appointments, include: :patient
  end

  def find_patient
    mypatient = Appointment.where(doctor_id: params[:id], patient_id: params[:patient_id])
  end

  def omniauth
    ::OmniAuth.config.path_prefix = '/doctor/auth'
    redirect_to google_oauth2_doctor_path("google_oauth2")
    @appointments = Appointment.new
  end


  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email)
  end

end
