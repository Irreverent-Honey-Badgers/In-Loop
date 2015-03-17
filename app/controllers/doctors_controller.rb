class DoctorsController < ApplicationController
  # before_action :authenticate_doctor!

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
  end

  def get_patient
    mypatients = Doctor.find(5).patients
    @patient = mypatients[1]
    render :json => @patient


  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email)
  end

end
