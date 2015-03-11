class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(doctor_params)
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email)
  end

end
