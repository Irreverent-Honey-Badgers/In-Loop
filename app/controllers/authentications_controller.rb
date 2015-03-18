class AuthenticationsController < ApplicationController

  def google_oauth2
    # Yo u need to implement the method below in your model (e.g. app/models/user.rb)
    binding.pry
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

  def action
    binding.pry

  end

  def failure
    binding.pry
  end

end
