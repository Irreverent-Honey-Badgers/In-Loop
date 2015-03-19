class AuthenticationsController < ApplicationController

  def google_oauth2
    # Yo u need to implement the method below in your model (e.g. app/models/user.rb)
    user = request.env["PATH_INFO"].gsub("/auth/google_oauth2/callback","").delete!("/")

    if user == "patient"
      @patient = Patient.from_omniauth(request.env["omniauth.auth"])

      if @patient.persisted?
        sign_in @patient,:event => :authentication #this will throw if @user is not activated
        redirect_to patient_path(@patient.id)
        # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_patient_registration_url
      end
    else
      @doctor = Doctor.from_omniauth(request.env["omniauth.auth"])

      if @doctor.persisted?
        sign_in @doctor,:event => :authentication #this will throw if @user is not activated
        redirect_to doctor_path(@doctor.id)
        # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_doctor_registration_url
      end

    end
  end

end
