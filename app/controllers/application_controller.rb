class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # force the user to redirect to the login page if the user was not logged in.
  # before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :phone_number, :email, :password, :password_confirmation, :remember_me) }
     devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :phone_number, :email, :password, :remember_me) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :phone_number, :email, :password, :password_confirmation, :current_password) }
  end
    protect_from_forgery with: :exception
    # before_action :authenticate_user!, :except => [:index, :show]


end
