Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET_ID"]
  { :scope => 'userinfo.email, userinfo.profile, https://www.googleapis.com/auth/calendar' }

  on_failure { |env| AuthenticationsController.action(:failure).call(env) }

end
