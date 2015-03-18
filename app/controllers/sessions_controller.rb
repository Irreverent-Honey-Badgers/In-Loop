class SessionsController < ApplicationController

  def google_oauth2
    # Yo u need to implement the method below in your model (e.g. app/models/user.rb)
    puts request.env["omniauth.params"]
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

  def passthru
   render status: 404, text: "Not found. Authentication passthru."
 end

 def failure
   set_flash_message :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
   redirect_to after_omniauth_failure_path_for(resource_name)
 end

 protected

 def failed_strategy
   env["omniauth.error.strategy"]
 end

 def failure_message
   exception = env["omniauth.error"]
   error   = exception.error_reason if exception.respond_to?(:error_reason)
   error ||= exception.error        if exception.respond_to?(:error)
   error ||= env["omniauth.error.type"].to_s
   error.to_s.humanize if error
 end

 def after_omniauth_failure_path_for(scope)
   new_session_path(scope)
 end

 def translation_scope
   'devise.omniauth_callbacks'
 end

end
