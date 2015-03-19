class DoctorsController < ApplicationController
  # before_action :authenticate_doctor!

  def index
    @doctors = Doctor.all
  end

  def show
    :authenticate_doctor!
  end

  def get_patient
    mypatients = Doctor.find(1).patients
    @patient = mypatients.first
    render :json => @patient


  end

  def omniauth
    ::OmniAuth.config.path_prefix = '/doctor/auth'
    redirect_to google_oauth2_doctor_path("google_oauth2")
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email)
  end

end
