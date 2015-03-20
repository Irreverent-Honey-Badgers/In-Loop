Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET_ID"]
  { :scope => 'userinfo.email, userinfo.profile, https://www.googleapis.com/auth/calendar' }

  on_failure do |env|
    message_key = env['omniauth.error.type']
    origin_query_param = env['omniauth.origin'] ? "&origin=#{CGI.escape(env['omniauth.origin'])}" : ""
    strategy_name_query_param = env['omniauth.error.strategy'] ? "&strategy=#{env['omniauth.error.strategy'].name}" : ""
    extra_params = env['omniauth.params'] ? "&#{env['omniauth.params'].to_query}" : ""
    new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}#{origin_query_param}#{strategy_name_query_param}#{extra_params}"
    Rack::Response.new(["302 Moved"], 302, 'Location' => new_path).finish
  end

end
