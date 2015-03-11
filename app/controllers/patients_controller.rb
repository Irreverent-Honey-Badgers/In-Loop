class PatientsController < ApplicationController

  def index
  end

  def show
    before_action :authenticate_patient!
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

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @patient = Patient.from_omniauth(request.env["omniauth.auth"])

    if @patient.persisted?
      sign_in @patient,:event => :authentication #this will throw if @user is not activated
      redirect_to patients_path
      # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_patient_registration_url
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone)
  end

end
