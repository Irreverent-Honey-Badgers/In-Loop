class PatientsController < ApplicationController
    # before_action :authenticate_patient!

  def index
    # redirect_to patient_path(current_patient.id)
  end

  def show
    :authenticate_patient!
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
  end

  def google_oauth2
    # Yo u need to implement the method below in your model (e.g. app/models/user.rb)
    @patient = Patient.from_omniauth(request.env["omniauth.auth"])

    if @patient.persisted?
      sign_in @patient,:event => :authentication #this will throw if @user is not activated
      redirect_to patient_path(@patient.id)
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
