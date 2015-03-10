class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone)
  end

end
