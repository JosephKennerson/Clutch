class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def google_oauth2
  #   @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  def redirect
  google_api_client = Google::APIClient.new({
    application_name: 'Clutch',
    application_version: '1.0.0'
  })

  google_api_client.authorization = Signet::OAuth2::Client.new({
    client_id: ENV.fetch("785528780110-ec471jbmth3tslqkj3etg6m3kbpqp1l6.apps.googleusercontent.com"),
    client_secret: ENV.fetch('G5SbjZhdygJ8esyRvmcreOvl'),
    authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
    scope: 'https://www.googleapis.com/auth/calendar.readonly',
    redirect_uri: url_for(:action => :callback)
  })

  authorization_uri = google_api_client.authorization.authorization_uri

  redirect_to authorization_uri.to_s
 end

 def callback
  google_api_client = Google::APIClient.new({
    application_name: 'Cluth',
    application_version: '1.0.0'
  })

  google_api_client.authorization = Signet::OAuth2::Client.new({
    client_id: ENV.fetch("785528780110-ec471jbmth3tslqkj3etg6m3kbpqp1l6.apps.googleusercontent.com"),
    client_secret: ENV.fetch('G5SbjZhdygJ8esyRvmcreOvl'),
    token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
    redirect_uri: url_for(:action => :callback),
    code: params[:code]
  })

  response = google_api_client.authorization.fetch_access_token!

  session[:access_token] = response['access_token']

  redirect_to url_for(:action => :calendars)
end
end