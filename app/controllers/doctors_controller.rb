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
    mypatients = Doctor.find(1).patients
    @patient = mypatients.first
    render :json => @patient
  end

  def find_patient
    mypatient = Location.where(doctor_id: params[:id], patient_id: params[:patient_id])

  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email)
  end

end
